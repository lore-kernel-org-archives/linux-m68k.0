From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k:  Use vsprintf %pM extension
Date: Tue, 16 Jun 2015 17:35:37 +1000
Message-ID: <557FD1C9.9090208@westnet.com.au>
References: <1434333697.2507.31.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1434333697.2507.31.camel@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi Joe,

On 15/06/15 12:01, Joe Perches wrote:
> Format mac addresses with the normal kernel extension.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Thanks. I have pushed this into the m68knommu git tree
(for-next branch) on kernel.org.

Regards
Greg


> ---
>  arch/m68k/68000/m68EZ328.c | 3 +--
>  arch/m68k/68000/m68VZ328.c | 3 +--
>  arch/m68k/68360/config.c   | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/68000/m68EZ328.c b/arch/m68k/68000/m68EZ328.c
> index 2195290..e6ab321 100644
> --- a/arch/m68k/68000/m68EZ328.c
> +++ b/arch/m68k/68000/m68EZ328.c
> @@ -62,8 +62,7 @@ void __init config_BSP(char *command, int len)
>  #ifdef CONFIG_UCSIMM
>    printk(KERN_INFO "uCsimm serial string [%s]\n",getserialnum());
>    p = cs8900a_hwaddr = gethwaddr(0);
> -  printk(KERN_INFO "uCsimm hwaddr %.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n",
> -         p[0], p[1], p[2], p[3], p[4], p[5]);
> +  printk(KERN_INFO "uCsimm hwaddr %pM\n", p);
>  
>    p = getbenv("APPEND");
>    if (p) strcpy(p,command);
> diff --git a/arch/m68k/68000/m68VZ328.c b/arch/m68k/68000/m68VZ328.c
> index 0e5e5a1..1154bdb 100644
> --- a/arch/m68k/68000/m68VZ328.c
> +++ b/arch/m68k/68000/m68VZ328.c
> @@ -152,8 +152,7 @@ static void __init init_hardware(char *command, int size)
>  
>  	printk(KERN_INFO "uCdimm serial string [%s]\n", getserialnum());
>  	p = cs8900a_hwaddr = gethwaddr(0);
> -	printk(KERN_INFO "uCdimm hwaddr %.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n",
> -		p[0], p[1], p[2], p[3], p[4], p[5]);
> +	printk(KERN_INFO "uCdimm hwaddr %pM\n", p);
>  	p = getbenv("APPEND");
>  	if (p)
>  		strcpy(p, command);
> diff --git a/arch/m68k/68360/config.c b/arch/m68k/68360/config.c
> index fd1f948c..b65fe4e 100644
> --- a/arch/m68k/68360/config.c
> +++ b/arch/m68k/68360/config.c
> @@ -154,8 +154,7 @@ void __init config_BSP(char *command, int len)
>  #if defined(CONFIG_UCQUICC) && 0
>    printk(KERN_INFO "uCquicc serial string [%s]\n",getserialnum());
>    p = scc1_hwaddr = gethwaddr(0);
> -  printk(KERN_INFO "uCquicc hwaddr %.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n",
> -         p[0], p[1], p[2], p[3], p[4], p[5]);
> +  printk(KERN_INFO "uCquicc hwaddr %pM\n", p);
>  
>    p = getbenv("APPEND");
>    if (p)
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
