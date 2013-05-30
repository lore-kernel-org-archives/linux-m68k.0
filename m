From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] arch: m68k: math-emu: unsigned issue, 'unsigned long' will never be less than zero.
Date: Thu, 30 May 2013 09:09:38 +0200
Message-ID: <m2a9ndndu5.fsf__48753.9570466199$1369897802$gmane$org@linux-m68k.org>
References: <51A6F0C6.9050806@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51A6F0C6.9050806@asianux.com> (Chen Gang's message of "Thu, 30
	May 2013 14:25:10 +0800")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

Chen Gang <gang.chen@asianux.com> writes:

> 'oldmant.m32[1]' is 'unsigned long' which never '< 0', and the original
> author wanted to check the highest bit whether set.
>
> So need type cast form 'unsigned long' to 'long'.

Better to make the bit test explicit, since it is not a sign bit.

> diff --git a/arch/m68k/math-emu/fp_arith.c b/arch/m68k/math-emu/fp_arith.c
> index 08f286d..ef013c5 100644
> --- a/arch/m68k/math-emu/fp_arith.c
> +++ b/arch/m68k/math-emu/fp_arith.c
> @@ -519,7 +519,7 @@ static void fp_roundint(struct fp_ext *dest, int mode)
>  				return;
>  			break;
>  		case 0x401e:
> -			if (!(oldmant.m32[1] >= 0))
> +			if (!((long)oldmant.m32[1] >= 0))

			if (oldmant.m32[1] & 0x80000000)

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
