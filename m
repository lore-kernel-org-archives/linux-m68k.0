From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: rcu alignment warning tripping on m68k
Date: Tue, 10 Jun 2014 16:22:37 +1000
Message-ID: <5396A42D.3000305@uclinux.org>
References: <538696A0.5090601@uclinux.org> <20140529141151.21ed6f95@alan.etchedpixels.co.uk> <5387DF05.1020103@uclinux.org> <20140606184605.GT4581@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:6815
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754715AbaFJGWn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 10 Jun 2014 02:22:43 -0400
In-Reply-To: <20140606184605.GT4581@linux.vnet.ibm.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Paul,

On 07/06/14 04:46, Paul E. McKenney wrote:
> On Fri, May 30, 2014 at 11:29:41AM +1000, Greg Ungerer wrote:
>> On 29/05/14 23:11, One Thousand Gnomes wrote:
>>> On Thu, 29 May 2014 12:08:32 +1000
>>> Greg Ungerer <gerg@uclinux.org> wrote:
>>>
>>>> Hi All,
>>>>
>>>> Inside kernel/rcy/tree.c in __call_rcu() it does an alignment check on
>>>> the head pointer passed in. This trips on m68k systems, because they only
>>>> need alignment of 32bit quantities to 16bit boundaries.
>>>
>>> __alignof perhaps ?
>>
>> That might do. Change then becomes something like:
>>
>> --- a/kernel/rcu/tree.c
>> +++ b/kernel/rcu/tree.c
>> @@ -2467,7 +2467,7 @@ __call_rcu(struct rcu_head *head, void (*func)(struct rcu_
>>         unsigned long flags;
>>         struct rcu_data *rdp;
>>
>> -       WARN_ON_ONCE((unsigned long)head & 0x3); /* Misaligned rcu_head! */
>> +       WARN_ON_ONCE((unsigned long)head & (__alignof__(head) - 1)); /* Misaligned rcu_head! */
> 
> Hmmm...  The purpose of the check is to reserve the low-order bits to
> allow RCU to classify callbacks as being time-critical or not.  RCU
> can probably live with a single bit, but if there is some architecture
> out there that simply refuses to do alignment, I need to know about it.

This change was prompted by this check tripping, so the alignment
issue is certainly real for m68k.

Regards
Greg


> (See "git show 0bb7b59d6e2b8" for more info.)
> 
> So how about this instead?
> 
>  -       WARN_ON_ONCE((unsigned long)head & 0x1); /* Misaligned rcu_head! */
> 
> (Trying to remember if I have seen Linux kernel code that uses both
> the lower bits...)
> 
> 							Thanx, Paul
> 
>>         if (debug_rcu_head_queue(head)) {
>>                 /* Probable double call_rcu(), so leak the callback. */
>>                 ACCESS_ONCE(head->func) = rcu_leak_callback;
>>
>> Thanks
>> Greg
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>
> 
> 
