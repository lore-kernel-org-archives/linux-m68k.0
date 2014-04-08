From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH v2 1/2] m68k: fix a compiler warning when building for
 DragonBall
Date: Tue, 08 Apr 2014 17:13:45 +1000
Message-ID: <5343A1A9.1000102@westnet.com.au>
References: <1396676398-31175-1-git-send-email-danieruru@gmail.com> <1396685145-12935-1-git-send-email-danieruru@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1396685145-12935-1-git-send-email-danieruru@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

Hi Daniel,

On 05/04/14 18:05, Daniel Palmer wrote:
> In file included from arch/m68k/kernel/setup.c:4:0:
> arch/m68k/kernel/setup_no.c:70:0: warning: "CPU_NAME" redefined [enabled by default]
>  #define CPU_NAME "MC68VZ328"
>  ^
> arch/m68k/kernel/setup_no.c:61:0: note: this is the location of the previous definition
>  #define CPU_NAME "MC68000"
>  ^
> 
> Signed-off-by: Daniel Palmer <danieruru@gmail.com>

Thanks, I'll add this to the m68knommu git tree.

Regards
Greg


>  arch/m68k/kernel/setup_no.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index 5b16f5d..88c27d9 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -58,17 +58,16 @@ void (*mach_halt)(void);
>  void (*mach_power_off)(void);
>  
>  #ifdef CONFIG_M68000
> -#define CPU_NAME	"MC68000"
> -#endif
> -#ifdef CONFIG_M68328
> +#if defined(CONFIG_M68328)
>  #define CPU_NAME	"MC68328"
> -#endif
> -#ifdef CONFIG_M68EZ328
> +#elif defined(CONFIG_M68EZ328)
>  #define CPU_NAME	"MC68EZ328"
> -#endif
> -#ifdef CONFIG_M68VZ328
> +#elif defined(CONFIG_M68VZ328)
>  #define CPU_NAME	"MC68VZ328"
> +#else
> +#define CPU_NAME	"MC68000"
>  #endif
> +#endif /* CONFIG_M68000 */
>  #ifdef CONFIG_M68360
>  #define CPU_NAME	"MC68360"
>  #endif
> 
