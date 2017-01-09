From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 7/7] uapi: export all headers under uapi directories
Date: Mon, 9 Jan 2017 12:01:08 +0000
Message-ID: <20170109120107.GW14217__33575.7126602859$1483963402$gmane$org@n2100.armlinux.org.uk>
References: <bf83da6b-01ef-bf44-b3e1-ca6fc5636818@6wind.com>
 <1483695839-18660-1-git-send-email-nicolas.dichtel@6wind.com>
 <1483695839-18660-8-git-send-email-nicolas.dichtel@6wind.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483695839-18660-8-git-send-email-nicolas.dichtel@6wind.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: arnd@arndb.de, linux-mips@linux-mips.org, alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, airlied@linux.ie, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, linux-c6x-dev@linux-c6x.org, linux-rdma@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, coreteam@netfilter.org, fcoe-devel@open-fcoe.org, xen-devel@lists.xenproject.org, linux-snps-arc@lists.infradead.org, linux-media@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org, linux-kbuild@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-raid@vger.kernel.orglin

On Fri, Jan 06, 2017 at 10:43:59AM +0100, Nicolas Dichtel wrote:
> diff --git a/arch/arm/include/uapi/asm/Kbuild b/arch/arm/include/uapi/asm/Kbuild
> index 46a76cd6acb6..607f702c2d62 100644
> --- a/arch/arm/include/uapi/asm/Kbuild
> +++ b/arch/arm/include/uapi/asm/Kbuild
> @@ -1,23 +1,6 @@
>  # UAPI Header export list
>  include include/uapi/asm-generic/Kbuild.asm
>  
> -header-y += auxvec.h
> -header-y += byteorder.h
> -header-y += fcntl.h
> -header-y += hwcap.h
> -header-y += ioctls.h
> -header-y += kvm_para.h
> -header-y += mman.h
> -header-y += perf_regs.h
> -header-y += posix_types.h
> -header-y += ptrace.h
> -header-y += setup.h
> -header-y += sigcontext.h
> -header-y += signal.h
> -header-y += stat.h
> -header-y += statfs.h
> -header-y += swab.h
> -header-y += unistd.h
>  genhdr-y += unistd-common.h
>  genhdr-y += unistd-oabi.h
>  genhdr-y += unistd-eabi.h

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
