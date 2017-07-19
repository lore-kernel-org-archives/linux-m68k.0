From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Restore symbol versions for symbols exported from assembly
Date: Wed, 19 Jul 2017 11:06:44 +0200
Message-ID: <mvmzic0ztgb.fsf@linux-m68k.org>
References: <20170719000324.GE18698@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170719000324.GE18698@decadent.org.uk> (Ben Hutchings's message
        of "Wed, 19 Jul 2017 01:03:25 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-m68k@lists.linux-m68k.org

On Jul 19 2017, Ben Hutchings <ben@decadent.org.uk> wrote:

> diff --git a/arch/m68k/include/asm/asm-prototypes.h b/arch/m68k/include/asm/asm-prototypes.h
> new file mode 100644
> index 000000000000..4cd692a44c11
> --- /dev/null
> +++ b/arch/m68k/include/asm/asm-prototypes.h
> @@ -0,0 +1,5 @@
> +extern void __divsi3(void);
> +extern void __modsi3(void);
> +extern void __mulsi3(void);
> +extern void __udivsi3(void);
> +extern void __umodsi3(void);

That doesn't match the actual prototypes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
