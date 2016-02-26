From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: Fix misspellings in comments.
Date: Fri, 26 Feb 2016 10:38:07 +1000
Message-ID: <56CF9E6F.7060309@westnet.com.au>
References: <1456389599-14349-1-git-send-email-adam.buchbinder@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1456389599-14349-1-git-send-email-adam.buchbinder@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Adam Buchbinder <adam.buchbinder@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: trivial@kernel.org

Hi Adam,

On 25/02/16 18:39, Adam Buchbinder wrote:
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  arch/m68k/include/asm/MC68328.h   | 6 +++---
>  arch/m68k/include/asm/MC68EZ328.h | 6 +++---
>  arch/m68k/include/asm/MC68VZ328.h | 6 +++---
>  arch/m68k/include/asm/m54xxacr.h  | 4 ++--
>  arch/m68k/include/asm/mac_iop.h   | 2 +-
>  arch/m68k/include/asm/mcftimer.h  | 2 +-
>  arch/m68k/mac/via.c               | 2 +-
>  7 files changed, 14 insertions(+), 14 deletions(-)

I have no problem with the MC68*328.h, m54xxacr.h and mcftimer.h
changes. So for those:

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg



> diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
> index 4ebf098..1a8080c 100644
> --- a/arch/m68k/include/asm/MC68328.h
> +++ b/arch/m68k/include/asm/MC68328.h
> @@ -798,7 +798,7 @@
>  
>  /**********
>   *
> - * 0xFFFFF7xx -- Serial Periferial Interface Slave (SPIS)
> + * 0xFFFFF7xx -- Serial Peripheral Interface Slave (SPIS)
>   *
>   **********/
>  
> @@ -824,7 +824,7 @@
>  
>  /**********
>   *
> - * 0xFFFFF8xx -- Serial Periferial Interface Master (SPIM)
> + * 0xFFFFF8xx -- Serial Peripheral Interface Master (SPIM)
>   *
>   **********/
>  
> @@ -904,7 +904,7 @@
>  
>  #define UBAUD_PRESCALER_MASK	0x003f	/* Actual divisor is 65 - PRESCALER */
>  #define UBAUD_PRESCALER_SHIFT	0
> -#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divizor */
> +#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divisor */
>  #define UBAUD_DIVIDE_SHIFT	8
>  #define UBAUD_BAUD_SRC		0x0800	/* Baud Rate Source */
>  #define UBAUD_GPIOSRC		0x1000	/* GPIO source */
> diff --git a/arch/m68k/include/asm/MC68EZ328.h b/arch/m68k/include/asm/MC68EZ328.h
> index d1bde58..fedac87 100644
> --- a/arch/m68k/include/asm/MC68EZ328.h
> +++ b/arch/m68k/include/asm/MC68EZ328.h
> @@ -631,7 +631,7 @@
>  
>  /**********
>   *
> - * 0xFFFFF8xx -- Serial Periferial Interface Master (SPIM)
> + * 0xFFFFF8xx -- Serial Peripheral Interface Master (SPIM)
>   *
>   **********/
>  
> @@ -712,7 +712,7 @@
>  
>  #define UBAUD_PRESCALER_MASK	0x003f	/* Actual divisor is 65 - PRESCALER */
>  #define UBAUD_PRESCALER_SHIFT	0
> -#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divizor */
> +#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divisor */
>  #define UBAUD_DIVIDE_SHIFT	8
>  #define UBAUD_BAUD_SRC		0x0800	/* Baud Rate Source */
>  #define UBAUD_UCLKDIR		0x2000	/* UCLK Direction */
> @@ -1160,7 +1160,7 @@ typedef volatile struct {
>  #define DRAMMC_COL10		0x0080	/* Col address bit for MD10 PA11/PA0  */
>  #define DRAMMC_COL9		0x0040	/* Col address bit for MD9  PA10/PA0  */
>  #define DRAMMC_COL8		0x0020	/* Col address bit for MD8  PA9/PA0   */
> -#define DRAMMC_REF_MASK		0x001f	/* Reresh Cycle */
> +#define DRAMMC_REF_MASK		0x001f	/* Refresh Cycle */
>  #define DRAMMC_REF_SHIFT	0
>  
>  /*
> diff --git a/arch/m68k/include/asm/MC68VZ328.h b/arch/m68k/include/asm/MC68VZ328.h
> index 6bd1bf1..34a51b2 100644
> --- a/arch/m68k/include/asm/MC68VZ328.h
> +++ b/arch/m68k/include/asm/MC68VZ328.h
> @@ -724,7 +724,7 @@
>  
>  /**********
>   *
> - * 0xFFFFF8xx -- Serial Periferial Interface Master (SPIM)
> + * 0xFFFFF8xx -- Serial Peripheral Interface Master (SPIM)
>   *
>   **********/
>  
> @@ -806,7 +806,7 @@
>  
>  #define UBAUD_PRESCALER_MASK	0x003f	/* Actual divisor is 65 - PRESCALER */
>  #define UBAUD_PRESCALER_SHIFT	0
> -#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divizor */
> +#define UBAUD_DIVIDE_MASK	0x0700	/* Baud Rate freq. divisor */
>  #define UBAUD_DIVIDE_SHIFT	8
>  #define UBAUD_BAUD_SRC		0x0800	/* Baud Rate Source */
>  #define UBAUD_UCLKDIR		0x2000	/* UCLK Direction */
> @@ -1256,7 +1256,7 @@ typedef struct {
>  #define DRAMMC_COL10		0x0080	/* Col address bit for MD10 PA11/PA0  */
>  #define DRAMMC_COL9		0x0040	/* Col address bit for MD9  PA10/PA0  */
>  #define DRAMMC_COL8		0x0020	/* Col address bit for MD8  PA9/PA0   */
> -#define DRAMMC_REF_MASK		0x001f	/* Reresh Cycle */
> +#define DRAMMC_REF_MASK		0x001f	/* Refresh Cycle */
>  #define DRAMMC_REF_SHIFT	0
>  
>  /*
> diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
> index 6d13cae..59e1710 100644
> --- a/arch/m68k/include/asm/m54xxacr.h
> +++ b/arch/m68k/include/asm/m54xxacr.h
> @@ -23,8 +23,8 @@
>  #define CACR_IEC	0x00008000	/* Enable instruction cache */
>  #define CACR_DNFB	0x00002000	/* Inhibited fill buffer */
>  #define CACR_IDPI	0x00001000	/* Disable CPUSHL */
> -#define CACR_IHLCK	0x00000800	/* Intruction cache half lock */
> -#define CACR_IDCM	0x00000400	/* Intruction cache inhibit */
> +#define CACR_IHLCK	0x00000800	/* Instruction cache half lock */
> +#define CACR_IDCM	0x00000400	/* Instruction cache inhibit */
>  #define CACR_ICINVA	0x00000100	/* Invalidate instr cache */
>  #define CACR_EUSP	0x00000020	/* Enable separate user a7 */
>  
> diff --git a/arch/m68k/include/asm/mac_iop.h b/arch/m68k/include/asm/mac_iop.h
> index fde874a..df3ea1a 100644
> --- a/arch/m68k/include/asm/mac_iop.h
> +++ b/arch/m68k/include/asm/mac_iop.h
> @@ -48,7 +48,7 @@
>  
>  /* IOP message status codes */
>  
> -#define IOP_MSGSTATUS_UNUSED	0	/* Unusued message structure       */
> +#define IOP_MSGSTATUS_UNUSED	0	/* Unused message structure       */
>  #define IOP_MSGSTATUS_WAITING	1	/* waiting for channel             */
>  #define IOP_MSGSTATUS_SENT	2	/* message sent, awaiting reply    */
>  #define IOP_MSGSTATUS_COMPLETE	3	/* message complete and reply rcvd */
> diff --git a/arch/m68k/include/asm/mcftimer.h b/arch/m68k/include/asm/mcftimer.h
> index 089f0f1..1150e42 100644
> --- a/arch/m68k/include/asm/mcftimer.h
> +++ b/arch/m68k/include/asm/mcftimer.h
> @@ -51,7 +51,7 @@
>   *	Bit definitions for the Timer Event Registers (TER).
>   */
>  #define	MCFTIMER_TER_CAP	0x01		/* Capture event */
> -#define	MCFTIMER_TER_REF	0x02		/* Refernece event */
> +#define	MCFTIMER_TER_REF	0x02		/* Reference event */
>  
>  /****************************************************************************/
>  #endif	/* mcftimer_h */
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> index ce56e04..920ff63 100644
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -68,7 +68,7 @@ static int gIER,gIFR,gBufA,gBufB;
>   * interrupt. This limitation also seems to apply to VIA clone logic cores in
>   * Quadra-like ASICs. (RBV and OSS machines don't have this limitation.)
>   *
> - * We used to fake it by configuring the relevent VIA pin as an output
> + * We used to fake it by configuring the relevant VIA pin as an output
>   * (to mask the interrupt) or input (to unmask). That scheme did not work on
>   * (at least) the Quadra 700. A NuBus card's /NMRQ signal is an open-collector
>   * circuit (see Designing Cards and Drivers for Macintosh II and Macintosh SE,
> 
