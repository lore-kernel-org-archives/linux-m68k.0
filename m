From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k/defconfig: fix stmark2 broken local compilation
Date: Mon, 4 Dec 2017 23:25:02 +1000
Message-ID: <9f309cf5-7a8a-0d0d-ad34-62511a470ea2@westnet.com.au>
References: <20171204101940.7bztuju66aj5xa3d@jerusalem>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:49703
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753648AbdLDNZG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Dec 2017 08:25:06 -0500
In-Reply-To: <20171204101940.7bztuju66aj5xa3d@jerusalem>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org

Hi Angelo,

On 04/12/17 20:19, Angelo Dureghello wrote:
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>

Thanks, that should do the trick.

Regards
Greg


>   arch/m68k/configs/stmark2_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index 55e55dbc2fb6..3d07b1de7eb0 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -5,7 +5,6 @@ CONFIG_SYSVIPC=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_NAMESPACES=y
>   CONFIG_BLK_DEV_INITRD=y
> -CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"
>   # CONFIG_RD_BZIP2 is not set
>   # CONFIG_RD_LZMA is not set
>   # CONFIG_RD_XZ is not set
> 
