FROM quay.io/openshift/okd-content@sha256:b1cdabbb00c04fee55a234a0c4585fa08fa07e887948b0e06468cca0bd8986ba

RUN rm -f /etc/yum.repos.d/crio.repo
COPY cri-o.repo /etc/yum.repos.d/crio.repo
RUN rpm-ostree uninstall cri-o
RUN rpm-ostree install cri-o-1.28.8-150500.1.1.x86_64 && \
    ostree container commit