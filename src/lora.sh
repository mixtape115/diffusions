accelerate launch train_dreambooth_lora.py \
  --pretrained_model_name_or_path="DGSpitzer/Cyberpunk-Anime-Diffusion"  \
  --instance_data_dir="/images/dogs" \
  --output_dir="/weights/dogs" \
  --instance_prompt="dogs" \
  --resolution=512 \
  --train_batch_size=1 \
  --sample_batch_size=1 \
  --gradient_accumulation_steps=1 \
  --checkpointing_steps=200 \
  --learning_rate=1e-4 \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=1000 \
  --seed="0"