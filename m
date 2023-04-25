Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA1CC77B61
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 09:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbjDYJ0W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 05:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjDYJ0V (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 05:26:21 -0400
Received: from welho-filter3.welho.com (welho-filter3b.welho.com [83.102.41.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4782210C
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 02:26:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter3.welho.com (Postfix) with ESMTP id ED4C0161FA;
        Tue, 25 Apr 2023 12:26:15 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
        by localhost (welho-filter3.welho.com [::ffff:83.102.41.25]) (amavisd-new, port 10024)
        with ESMTP id 9ocwQw2mY6I8; Tue, 25 Apr 2023 12:26:15 +0300 (EEST)
Received: from [192.168.0.20] (89-27-44-184.bb.dnainternet.fi [89.27.44.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp3.welho.com (Postfix) with ESMTPSA id 6DD512321;
        Tue, 25 Apr 2023 12:26:13 +0300 (EEST)
Message-ID: <07643256-bf18-bd8f-9085-f6d22c8edf4f@helsinkinet.fi>
Date:   Tue, 25 Apr 2023 12:26:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: signal delivery, was Re: reliable reproducer
To:     debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
 <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
 <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 25.4.2023 4.55, Finn Thain wrote:
> On Tue, 25 Apr 2023, Finn Thain wrote:
...
>> I wonder if we are seeing some fallout from the issue described in
>> do_page_fault() i.e. usp is unreliable.
>>
>>                  /* Accessing the stack below usp is always a bug.  The
>>                     "+ 256" is there due to some instructions doing
>>                     pre-decrement on the stack and that doesn't show up
>>                     until later.  */
>>                  if (address + 256 < rdusp())
>>                          goto map_err;
>>
>> Maybe we should try modifying get_sigframe() to increase the gap between
>> the signal and exception frames from 0-1 long words up to 64-65 long
>> words.
> 
> It turns out that doing so (patch below) does make the problem go away.
> Was the exception frame getting clobbered?
> 
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index b9f6908a31bc..94104699f5a8 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t frame_size)
>   {
>   	unsigned long usp = sigsp(rdusp(), ksig);
>   
> -	return (void __user *)((usp - frame_size) & -8UL);
> +	return (void __user *)((usp - 256 - frame_size) & -8UL);
>   }
>   
>   static int setup_frame(struct ksignal *ksig, sigset_t *set,

While this is most likely Hatari emulation [1] issue, it has some of the 
same triggering conditions, so I thought to mention it...

Above patch does not fix kernel panic I'm seen on booting Linux under 
Hatari emulated Atari Falcon, to a small IDE root fs with just (old 
Debian) Busybox and a shell script acting as init:
----------------------------------------
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: sh Not tainted 6.2.0hatari-00006-g01793428cbc5-dirty #4
Stack from 00819dc8:
         00819dc8 0032b646 0032b646 00027800 00000001 00819de8 00292878 
0032b646
         00819e0c 0028d60e 00027848 0000000b 0081caff 000300d6 00815a90 
00000000
         00819f2c 00819e50 00028878 003243fd 0000000b 0000000b 00818007 
0081ca30
         000300d6 0081caf8 00000001 00819f18 0081bbd0 00819f2c 00000000 
00000000
         00000000 00000000 00819e60 00028ea0 0000000b 0000000b 00819e98 
000303c8
         0000000b 00818000 00000002 00000000 00000000 00000000 8017705e 
00819f78
Call Trace: [<00027800>] set_cpu_online+0x1c/0x3e
  [<00292878>] dump_stack+0x10/0x16
  [<0028d60e>] panic+0xc4/0x22a
  [<00027848>] arch_local_irq_enable+0x0/0x22
  [<000300d6>] do_signal_stop+0x0/0x152
  [<00028878>] do_exit+0x138/0x642
  [<000300d6>] do_signal_stop+0x0/0x152
  [<00028ea0>] do_group_exit+0x22/0x62
  [<000303c8>] get_signal+0xf8/0x4ba
  [<00003508>] test_ti_thread_flag+0x0/0x1a
  [<00003f4a>] do_notify_resume+0x36/0x488
  [<00005706>] send_fault_sig+0x28/0x8c
  [<00005888>] do_page_fault+0x11e/0x242
  [<00005814>] do_page_fault+0xaa/0x242
  [<00002814>] do_signal_return+0x10/0x1a
  [<00020007>] _I_CALL_TOP+0xd83/0x1900
  [<0000b280>] sp_over+0x2c/0x3c
  [<00007201>] atari_irq_enable+0x3/0x2a
  [<000066f6>] atari_get_hardware_list+0x33a/0x3e8
----------------------------------------

(Only way to get rid of the panic is disabling both CPU cache and 
prefetch emulation.)


Is it possible that in your case there's also IRQ (exception) happening 
at the same time with page fault and signal?


	- Eero

[1] 030 MMU vs. cache/prefetch vs. exception handling vs. IDE emulation.
