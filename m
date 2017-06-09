From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 18/35] m68k: defconfig: Cleanup from old Kconfig options
Date: Fri, 9 Jun 2017 11:11:30 +1000
Message-ID: <ed1a6f44-643a-b728-c421-c4a77ebe35c5@westnet.com.au>
References: <20170608160836.12196-1-krzk@kernel.org>
 <20170608161049.12421-18-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170608161049.12421-18-krzk@kernel.org>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi  Krzyszto,

On 09/06/17 02:10, Krzysztof Kozlowski wrote:
> Remove old, dead Kconfig option INET_LRO. It is gone since
> commit 7bbf3cae65b6 ("ipv4: Remove inet_lro library").
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I will take that via the m68knommu git tree. Thanks.
Its in the for-next branch now.

Regards
Greg



> ---
>  arch/m68k/configs/m5208evb_defconfig | 1 -
>  arch/m68k/configs/m5249evb_defconfig | 1 -
>  arch/m68k/configs/m5272c3_defconfig  | 1 -
>  arch/m68k/configs/m5275evb_defconfig | 1 -
>  arch/m68k/configs/m5307c3_defconfig  | 1 -
>  arch/m68k/configs/m5407c3_defconfig  | 1 -
>  6 files changed, 6 deletions(-)
> 
> diff --git a/arch/m68k/configs/m5208evb_defconfig b/arch/m68k/configs/m5208evb_defconfig
> index 4c7b7938d53a..a3102ff7e5ed 100644
> --- a/arch/m68k/configs/m5208evb_defconfig
> +++ b/arch/m68k/configs/m5208evb_defconfig
> @@ -26,7 +26,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5249evb_defconfig b/arch/m68k/configs/m5249evb_defconfig
> index a782f368650f..f7bb9ed3efa8 100644
> --- a/arch/m68k/configs/m5249evb_defconfig
> +++ b/arch/m68k/configs/m5249evb_defconfig
> @@ -27,7 +27,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5272c3_defconfig b/arch/m68k/configs/m5272c3_defconfig
> index 6f5fb92f5cbf..1e679f6a400f 100644
> --- a/arch/m68k/configs/m5272c3_defconfig
> +++ b/arch/m68k/configs/m5272c3_defconfig
> @@ -27,7 +27,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5275evb_defconfig b/arch/m68k/configs/m5275evb_defconfig
> index b5d7cd1ce856..d2987b40423e 100644
> --- a/arch/m68k/configs/m5275evb_defconfig
> +++ b/arch/m68k/configs/m5275evb_defconfig
> @@ -27,7 +27,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5307c3_defconfig b/arch/m68k/configs/m5307c3_defconfig
> index 1b4c09461c40..97a78c99eeee 100644
> --- a/arch/m68k/configs/m5307c3_defconfig
> +++ b/arch/m68k/configs/m5307c3_defconfig
> @@ -27,7 +27,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/m68k/configs/m5407c3_defconfig b/arch/m68k/configs/m5407c3_defconfig
> index 275ad543d4bc..766a97f39a3a 100644
> --- a/arch/m68k/configs/m5407c3_defconfig
> +++ b/arch/m68k/configs/m5407c3_defconfig
> @@ -28,7 +28,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
> -# CONFIG_INET_LRO is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_FW_LOADER is not set
> 
