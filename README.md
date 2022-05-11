# s3-mounter

Mount s3 buckets into pods in k8s.

Credit:
[Code based in meain/blog](https://blog.meain.io/2020/mounting-s3-bucket-kube/) explains it in detail.
[Amazon CN blog of K8s s3fuse sharing](https://aws.amazon.com/cn/blogs/china/use-u3fs-as-shared-storage-to-kubernetes-pod/) refined the solution (written in Simplified Chinese)

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

More advanced feature with Aws S3 File Gateway integration
https://github.com/ctrox/csi-s3
https://docs.aws.amazon.com/filegateway/latest/files3/using-csi-drivers.html