From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Event tracing support on m68k
Date: Mon, 22 Oct 2012 16:36:39 +0200
Message-ID: <m2sj96zi88.fsf@igel.home>
References: <CALF0-+W9ZZNW-ciRyk64WqsSwXVXHjVaFRC563XHN1--S+=Zgw@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <CALF0-+W9ZZNW-ciRyk64WqsSwXVXHjVaFRC563XHN1--S+=Zgw@mail.gmail.com>
 (Ezequiel Garcia's message of "Mon, 22 Oct 2012 11:22:32 -0300")
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>, Steven Rostedt <rostedt@goodmis.org>, Tim Bird <tim.bird@am.sony.com>
List-Id: linux-m68k@vger.kernel.org

Ezequiel Garcia <elezegarcia@gmail.com> writes:

> While trying to trace an m68k (without MMU) platform, I discovered
> there's no "TRACING"
> option on m68k menuconfig.
>
> * Am I doing anything wrong? Is there no tracing support on m68k?

>From Documentation/trace/ftrace-design.txt:

Prerequisites
-------------

Ftrace relies on these features being implemented:
 STACKTRACE_SUPPORT - implement save_stack_trace()
 TRACE_IRQFLAGS_SUPPORT - implement include/asm/irqflags.h

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
