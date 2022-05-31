# Unikernels

This repository contains some unikernel developed/maintained by Tarides. They are usually buildable with:
```sh
$ mirage configure -t <your-target>
$ make depends
$ mirage build
```

Their deployements depend on your target. Usually, we prefer to deploy unikernels on [KVM][kvm] but [Xen][xen] is another possible target for these unikernels.

## The SMTP stack

Specially about the SMTP stack (which includes all of these unikernels), a _deployer_ exists with a tutorial to explain how to deploy our SMTP stack from scratch with KVM: [`ptt-deployer`][ptt-deployer]

[kvm]: https://www.linux-kvm.org/page/Main_Page
[xen]: https://xenproject.org/
[ptt-deployer]: https://github.com/mirage/ptt-deployer
