import torch
import numpy as np
from itertools import chain


def hash_func(k_freqs):
    """ Return an ordered list of the dominant frequencies as a string hash value.
    Input:
        - k_freqs. # .shape = [k, n_vars] 
    Output:
        - hash_values.
    """
    return np.array(['-'.join(map(str, k_freq.tolist())) for k_freq in k_freqs.T])

def k_dominant_frequency_hashing(batch_x, k, freq_list=None, min_thres=None):
    """ k-Dominant Frequency Hashing (k-DFH) """
    
    x_amp = torch.fft.rfft(batch_x, dim=1).abs()
    x_amp = torch.mean(x_amp, dim=0) # Averaging for batch: [batch_size, n_freq, n_var] -> [n_freq,n_var]

    if freq_list != None:
        k_amps, k_freqs = torch.topk(x_amp[freq_list], k=k, dim=0)  # LPF(Low pass filter)
        k_freqs += freq_list[0]
    else:
        k_amps, k_freqs = torch.topk(x_amp, k=k, dim=0)  # without LPF

    if min_thres != None:
        k_freqs = k_freqs * (k_amps >= min_thres) # non-dominant top-k
        k_freqs += (k_amps < min_thres) * 99

    hash_values = hash_func(k_freqs)
    return hash_values

def efficient_sampler(x, k, group_size, freq_list, min_thres=None, return_group=False):

    # k-Dominant Frequency Hashing(k-DFH).
    hash_values = k_dominant_frequency_hashing(x, k, freq_list, min_thres)
    
    sparse_indices = []

    if return_group: 
        group_dict = {}

    # Iteration for each group
    for value in np.unique(hash_values):
        group_indices = np.where(hash_values == value)[0].tolist() # get group indices
        group_indices = np.random.choice(group_indices, min(group_size, len(group_indices)), replace=True) # Any sampling method can be utilized.
        sparse_indices.append(group_indices)

        if return_group:
            group_dict[value] = group_indices

    sample_indices = sorted(list(chain.from_iterable(sparse_indices)))

    if return_group:
        return sample_indices, group_dict

    return sample_indices
