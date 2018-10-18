FROM moneysmartco/drone-terraform

WORKDIR /terraform

COPY . .

RUN cp backend.tf.sample backend.tf

