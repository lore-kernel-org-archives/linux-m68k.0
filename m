From: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: Event tracing support on m68k
Date: Mon, 22 Oct 2012 11:53:02 -0300
Message-ID: <CALF0-+WrgcJWHkMsCoD4YHz+Q=Uqu4fkPoZ6JuufLuQ29JTotw@mail.gmail.com>
References: <CALF0-+W9ZZNW-ciRyk64WqsSwXVXHjVaFRC563XHN1--S+=Zgw@mail.gmail.com>
 <m2sj96zi88.fsf@igel.home>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <m2sj96zi88.fsf@igel.home>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>, Steven Rostedt <rostedt@goodmis.org>, Tim Bird <tim.bird@am.sony.com>
List-Id: linux-m68k@vger.kernel.org

On Mon, Oct 22, 2012 at 11:36 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Ezequiel Garcia <elezegarcia@gmail.com> writes:
>
>> While trying to trace an m68k (without MMU) platform, I discovered
>> there's no "TRACING"
>> option on m68k menuconfig.
>>
>> * Am I doing anything wrong? Is there no tracing support on m68k?
>
> From Documentation/trace/ftrace-design.txt:
>
> Prerequisites
> -------------
>
> Ftrace relies on these features being implemented:
>  STACKTRACE_SUPPORT - implement save_stack_trace()
>  TRACE_IRQFLAGS_SUPPORT - implement include/asm/irqflags.h
>

Yeah, I read that too. Perhaps the real question should be:

Is it just not implemented on this platform or is there no way to implement it?
(and is it a wanted feature by the m68k users?)

But, I'm still confused on why this stuff is needed to get trace events.

Thanks!

    Ezequiel
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
