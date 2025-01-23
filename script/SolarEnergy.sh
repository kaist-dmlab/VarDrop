export CUDA_VISIBLE_DEVICES=4

model_name=OURS
k=4
group_size=20
iter=5

python -u run.py \
  --is_training 1 \
  --root_path ./dataset/Solar/ \
  --data_path solar_AL.txt \
  --model_id solar_96_96 \
  --model $model_name \
  --data Solar \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --enc_in 137 \
  --dec_in 137 \
  --c_out 137 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --learning_rate 0.0005 \
  --k $k \
  --group_size $group_size \
  --itr $iter

python -u run.py \
  --is_training 1 \
  --root_path ./dataset/Solar/ \
  --data_path solar_AL.txt \
  --model_id solar_96_192 \
  --model $model_name \
  --data Solar \
  --features M \
  --seq_len 96 \
  --pred_len 192 \
  --e_layers 2 \
  --enc_in 137 \
  --dec_in 137 \
  --c_out 137 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --learning_rate 0.0005 \
  --k $k \
  --group_size $group_size \
  --itr $iter

python -u run.py \
  --is_training 1 \
  --root_path ./dataset/Solar/ \
  --data_path solar_AL.txt \
  --model_id solar_96_336 \
  --model $model_name \
  --data Solar \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --enc_in 137 \
  --dec_in 137 \
  --c_out 137 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --learning_rate 0.0005 \
  --k $k \
  --group_size $group_size \
  --itr $iter

python -u run.py \
  --is_training 1 \
  --root_path ./dataset/Solar/ \
  --data_path solar_AL.txt \
  --model_id solar_96_720 \
  --model $model_name \
  --data Solar \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --enc_in 137 \
  --dec_in 137 \
  --c_out 137 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --learning_rate 0.0005 \
  --k $k \
  --group_size $group_size \
  --itr $iter
