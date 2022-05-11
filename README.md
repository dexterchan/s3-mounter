# s3-mounter

Mount s3 buckets into pods in k8s.

[Here](https://blog.meain.io/2020/mounting-s3-bucket-kube/) is a blog post which explains it in detail.

20220511
It is working in AWS EKS

20220501
It is not working in k3s rancher.....
failed to map the content to example pod

Suggestion --- verified not working:
https://icicimov.github.io/blog/virtualization/Kubernetes-shared-storage-with-S3-backend/
IN the host,
```
mkdir /mnt/s3data
mount --bind /mnt/s3data /mnt/s3data
mount --make-shared /mnt/s3data
findmnt -o TARGET,PROPAGATION /mnt/s3data
```

another example
https://github.com/freegroup/kube-s3

Next try:
https://github.com/ctrox/csi-s3
https://docs.aws.amazon.com/filegateway/latest/files3/using-csi-drivers.html