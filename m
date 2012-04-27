From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Quest about m68knommu check in top of kernel Makefile.
Date: Fri, 27 Apr 2012 16:30:52 +1000
Message-ID: <4F9A3D1C.4030305@snapgear.com>
References: <CAKjXMyAvBMgPEsdiO=F1oLHt-_DBxdoz9+G=AOsejn5SLfDS_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAKjXMyAvBMgPEsdiO=F1oLHt-_DBxdoz9+G=AOsejn5SLfDS_g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Edward Shao <laface.tw@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

Hi Edward,

On 26/04/12 22:34, Edward Shao wrote:
> I have a question about ($(ARCH),m68knommu) check in top of kernel Makefile.
> Any reason not to change SRCARCH but change hdr-arch?
>
> If I modify the makefile as below, is it ok?
>
> diff --git a/Makefile b/Makefile
> index afc868e..396ed28 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -228,13 +228,14 @@ ifeq ($(ARCH),tilegx)
> 	SRCARCH := tile
>  endif
>
> -# Where to locate arch specific headers
> -hdr-arch	:= $(SRCARCH)
> -
> +# Additional ARCH settings for m86k
>  ifeq ($(ARCH),m68knommu)
> -	hdr-arch	:= m68k
> +	SRCARCH := m68k
>  endif
>
> +# Where to locate arch specific headers
> +hdr-arch	:= $(SRCARCH)
> +
>  KCONFIG_CONFIG ?= .config
>  export KCONFIG_CONFIG

I think it better to just remove the whole m68knommu conditional,
since there is not longer a separate m68knommu arch branch.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
