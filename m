From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 3/5] m68k: delay, muldi3 - Use CONFIG_CPU_HAS_NO_MULDIV64
Date: Fri, 8 Jun 2012 13:48:16 +1000
Message-ID: <4FD17600.4010707@snapgear.com>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org> <1339094827-12349-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-3-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org

On 08/06/12 04:47, Geert Uytterhoeven wrote:
> instead of open coding CONFIG_M68000 || CONFIG_COLDFIRE
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer<gerg@uclinux.org>

Regards
Greg


>   arch/m68k/include/asm/delay.h |    2 +-
>   arch/m68k/lib/muldi3.c        |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
> index 9c09bec..12d8fe4 100644
> --- a/arch/m68k/include/asm/delay.h
> +++ b/arch/m68k/include/asm/delay.h
> @@ -43,7 +43,7 @@ static inline void __delay(unsigned long loops)
>   extern void __bad_udelay(void);
>
>
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#ifdef CONFIG_CPU_HAS_NO_MULDIV64
>   /*
>    * The simpler m68k and ColdFire processors do not have a 32*32->64
>    * multiply instruction. So we need to handle them a little differently.
> diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
> index 79e928a..ee5f0b1 100644
> --- a/arch/m68k/lib/muldi3.c
> +++ b/arch/m68k/lib/muldi3.c
> @@ -19,7 +19,7 @@ along with GNU CC; see the file COPYING.  If not, write to
>   the Free Software Foundation, 59 Temple Place - Suite 330,
>   Boston, MA 02111-1307, USA.  */
>
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#ifdef CONFIG_CPU_HAS_NO_MULDIV64
>
>   #define SI_TYPE_SIZE 32
>   #define __BITS4 (SI_TYPE_SIZE / 4)


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
