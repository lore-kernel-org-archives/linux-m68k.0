From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: Fix trivial typos in comments
Date: Tue, 10 Mar 2015 11:46:25 +1000
Message-ID: <54FE4CF1.5010903__22987.9220285968$1425952550$gmane$org@westnet.com.au>
References: <1425936564-9680-1-git-send-email-yguerrini@tomshardware.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1425936564-9680-1-git-send-email-yguerrini@tomshardware.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick Guerrini <yguerrini@tomshardware.fr>, geert@linux-m68k.org
Cc: trivial@kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


Hi Yannick,

On 10/03/15 07:29, Yannick Guerrini wrote:
> Change 'Reaceive' to 'Receive'
> Change 'alighnment' to 'alignment'
> 
> Signed-off-by: Yannick Guerrini <yguerrini@tomshardware.fr>

Thanks. I have put this in the m68knommu git tree, for-next branch.

Regards
Greg



> ---
>  arch/m68k/include/asm/m68360_pram.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/m68360_pram.h b/arch/m68k/include/asm/m68360_pram.h
> index e6088bb..c0cbd96 100644
> --- a/arch/m68k/include/asm/m68360_pram.h
> +++ b/arch/m68k/include/asm/m68360_pram.h
> @@ -170,7 +170,7 @@ struct uart_pram {
>      unsigned short  frmer;          /* Rx framing error counter */
>      unsigned short  nosec;          /* Rx noise counter */
>      unsigned short  brkec;          /* Rx break character counter */
> -    unsigned short  brkln;          /* Reaceive break length */
> +    unsigned short  brkln;          /* Receive break length */
>                     
>      unsigned short  uaddr1;         /* address character 1 */
>      unsigned short  uaddr2;         /* address character 2 */
> @@ -338,7 +338,7 @@ struct ethernet_pram {
>      unsigned long   c_pres;         /* preset CRC */
>      unsigned long   c_mask;         /* constant mask for CRC */
>      unsigned long   crcec;          /* CRC error counter */
> -    unsigned long   alec;           /* alighnment error counter */
> +    unsigned long   alec;           /* alignment error counter */
>      unsigned long   disfc;          /* discard frame counter */
>      unsigned short  pads;           /* short frame PAD characters */
>      unsigned short  ret_lim;        /* retry limit threshold */
> 
