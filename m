From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: add Sysam stmark2 open board support
Date: Mon, 4 Dec 2017 14:22:22 +1000
Message-ID: <6f9ca6ab-1e44-8a41-e27d-07e2af297346@westnet.com.au>
References: <20171012224251.1015-1-angelo@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:28743
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752949AbdLDEcl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Dec 2017 23:32:41 -0500
In-Reply-To: <20171012224251.1015-1-angelo@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org

Hi Angelo,

On 13/10/17 08:42, Angelo Dureghello wrote:
> Add support for Sysam stmark2 board, an open hardware embedded
> Linux board, see http://sysam.it/cff_stmark2.html for any info.
> 
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> ---
[snip]
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> new file mode 100644
> index 000000000000..55e55dbc2fb6
> --- /dev/null
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -0,0 +1,92 @@
> +CONFIG_LOCALVERSION="stmark2-001"
> +CONFIG_DEFAULT_HOSTNAME="stmark2"
> +CONFIG_SYSVIPC=y
> +# CONFIG_FHANDLE is not set
> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_NAMESPACES=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"

This causes a stand alone kernel defconfig build of stmark2 to fail with:

...
  CC      init/calibrate.o
  CC      init/init_task.o
  AR      init/built-in.o
  HOSTCC  usr/gen_init_cpio
  ./scripts/gen_initramfs_list.sh: Cannot open '../uClinux-dist/romfs'
make[1]: *** [usr/initramfs_data.cpio.gz] Error 1
make: *** [usr] Error 2

Obviously in a stand alone build you cannot rely on any directory
paths outside of the kernel tree.

The simple solution is just to remove this CONFIG_INITRAMFS_SOURCE
line - and that results in complete build. Of course it won't
work on your target as expected though.

Other ColdFire defconfigs don't use an init ramfs, instead using
a local ram based MTD partition. 

Do you want to come up with a patch to fix this?
Otherwise I will create a patch that just removes that one line.

Regards
Greg
