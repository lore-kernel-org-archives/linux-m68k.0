From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: add Sysam stmark2 open board support
Date: Mon, 4 Dec 2017 09:35:03 +0100
Message-ID: <20171204083502.dicnghsp2ecwqufx@jerusalem>
References: <20171012224251.1015-1-angelo@sysam.it>
 <6f9ca6ab-1e44-8a41-e27d-07e2af297346@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com ([18.194.220.216]:36976
        "EHLO sysam.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752830AbdLDImc (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 4 Dec 2017 03:42:32 -0500
Content-Disposition: inline
In-Reply-To: <6f9ca6ab-1e44-8a41-e27d-07e2af297346@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Dec 04, 2017 at 02:22:22PM +1000, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 13/10/17 08:42, Angelo Dureghello wrote:
> > Add support for Sysam stmark2 board, an open hardware embedded
> > Linux board, see http://sysam.it/cff_stmark2.html for any info.
> > 
> > Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> > ---
> [snip]
> > diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> > new file mode 100644
> > index 000000000000..55e55dbc2fb6
> > --- /dev/null
> > +++ b/arch/m68k/configs/stmark2_defconfig
> > @@ -0,0 +1,92 @@
> > +CONFIG_LOCALVERSION="stmark2-001"
> > +CONFIG_DEFAULT_HOSTNAME="stmark2"
> > +CONFIG_SYSVIPC=y
> > +# CONFIG_FHANDLE is not set
> > +CONFIG_LOG_BUF_SHIFT=14
> > +CONFIG_NAMESPACES=y
> > +CONFIG_BLK_DEV_INITRD=y
> > +CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"
> 
> This causes a stand alone kernel defconfig build of stmark2 to fail with:
> 
> ...
>   CC      init/calibrate.o
>   CC      init/init_task.o
>   AR      init/built-in.o
>   HOSTCC  usr/gen_init_cpio
>   ./scripts/gen_initramfs_list.sh: Cannot open '../uClinux-dist/romfs'
> make[1]: *** [usr/initramfs_data.cpio.gz] Error 1
> make: *** [usr] Error 2
> 
> Obviously in a stand alone build you cannot rely on any directory
> paths outside of the kernel tree.
> 
> The simple solution is just to remove this CONFIG_INITRAMFS_SOURCE
> line - and that results in complete build. Of course it won't
> work on your target as expected though.
> 
> Other ColdFire defconfigs don't use an init ramfs, instead using
> a local ram based MTD partition. 
> 
> Do you want to come up with a patch to fix this?
> Otherwise I will create a patch that just removes that one line.
> 

ooh, ok, i'll remove that entry.
I'll post a patch in short, just that the build is not breaking anymore. 
Used this method initially since spi driver was still not available,
will check then about local ram based MTD partition.

Jfyi,
this defconfig will then follow several additions, i am now working on
the mmc/sd driver. Also, i tried to enable mmu but seems there are some
issues now that i added the spi driver, system hangs someway adding
spi platform drivers to the bus. I am investigating into this too.

> Regards
> Greg
> 
> 

Regards,
Angelo

> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
