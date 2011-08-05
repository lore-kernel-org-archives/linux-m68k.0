From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Sat, 06 Aug 2011 10:32:45 +1200
Message-ID: <4E3C6F8D.7030902@gmail.com>
References: <4E369834.9070707@aalto.fi>	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>	<4E3ACFE5.7020901@aalto.fi> <CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com> <4E3BD9C1.6020209@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E3BD9C1.6020209@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Tuomas,

there is a pattern to this - most of the times the watchdog fires when 
the IDE interface is probed. In that case we have  TSR=0x3, ISR=0x3 
(need to look up what that means in the driver headers).

Other times, it is either the floppy interface getting probed, or in one 
case, the mouse. The TSR is different there (0x5).

It appears interrupts from the card get lost when other drivers disable 
interrupts for too long. I'd go back to a version of the kernel before 
we moved to the genirq framework (that was at the end of May this year). 
If that still works, bisect from there (man git-bisect) to find the 
approximate commit that broke Amiga ethernet.

If you cannot use git-bisect, I'd have to build kernels for you to test 
again and again until we find the last one that works - quite slow a 
procedure but it might be the only thing.

Geert: is the genirq change simple to back out, just for tests?

Cheers,

   Michael

On 05/08/11 23:53, Tuomas Vainikka wrote:
> On 08/04/2011 11:45 PM, Michael Schmitz wrote:
>> On Fri, Aug 5, 2011 at 4:59 AM, Tuomas Vainikka
>> <tuomas.vainikka@aalto.fi>  wrote:
>>> Hello,
>>>
>>> The other network drivers were previously compiled as modules, and I 
>>> only
>>> had apne built-in.
>>> Now I removed the other drivers being built in any way, but I still 
>>> get an
>>> error:
>> Is there a way to get timestamps logged with each of the entries in
>> the call trace below (i.e. could we rig some profiling code for that)?
>> Would be interesting to know where exactly the kernel was spinning
>> when the watchdog fired. But maybe that's obvious to someone.
>>
>> Are there potential deadlocks with printk called from softirq context
>> (I think not ...)? What is the message printed immediately after the
>> trace?
> I've attached full dmesg outputs from ten sequential boots with the 
> kernel config.
> You can see that the trace can happen any time, or not at all.
>> Last - has anyone ever tried to bisect this?
>>
>> Cheers,
>>
>>    Michael
>>
>
