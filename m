Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91816190C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719408547; cv=none; b=YVA1EkDGhnLIB1MXEptQsvHmXz29l+8KNAxV4ZmSUrO8W6D8k2rf2vGGS6ZjvBLAVHHnIkIislrwZD9A/3sDgScFoibZWe81CGt/w/Iz+xnxVTGPoFHPKZRJYQCQqchKUhf69hGdGtRNM7s4FpNOtr9I8zFfrGNh8iKmfcxc61Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719408547; c=relaxed/simple;
	bh=wiR0EkU/WqdTVBMFyMY0qnallqaWt+LqKgaV6SpThdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNFR4S35IRf8sM4xWJPJLo9vMXrjsVpBRcaDVyqso9fzUeqDc1LycmeejyZwgjS5rvs0sqCkcJCob3kqxBiz65GXxySseprkd6da2S7flHuE2XNS0U7J5jC0VAmOi4M/O7jZ/IbKMsDmKM+nrsFViLnOzlNRKu1l86bZQane+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=YF9SH7dc; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="YF9SH7dc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3DA5C0008;
	Wed, 26 Jun 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719408543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP9w32Smj5kF17ItJ7qIzuuKC9WIW96IhYXhKbYU93I=;
	b=YF9SH7dcM5Eiiczp9j4yCDk7UnAhKzh45lFnp3oP7N6GRJUTQNXvT+yG8YbMuCRgmtjzQC
	sK9qaTMcsqu8QgLbS5uElTkMVhIJcfaWSFADZXy389mqBTihQKqqAZ8ijNHLGDWMgDqRtV
	SabjU2aTulUHz9313MaRd4c6tQ+Tqek6EuUXYWVhPFJL8H8iLhViJnd2/5enVuG+EAdFA4
	22hxiw3isspMg1v/YiG8RNki6CffHPH0adsaPx4vhlodQiT0uabw6uIN7WnsJAdv0n3kHn
	R/UILgt1tlH+k7Bp8jYeVhwtlw5XYCbaJzegKVYENyrtqnzNZ4Z3BlCp+ezRyQ==
Message-ID: <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
Date: Wed, 26 Jun 2024 15:28:59 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
Content-Language: en-US, fr
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,

On 26/06/2024 03:56, Michael Schmitz wrote:
> Jean-Michel,
> 
> On 24/06/24 20:56, Jean-Michel Hautbois wrote:
>>
>> When I printk the do_page_fault first debug, I get for the first call 
>> to ls:
>> bash-5.2# ls
>> [   14.700000] do page fault:
>> [   14.700000] regs->sr=0x0, regs->pc=0x70069ee6, address=0x70069ee6, 
>> 0, (ptrval)
> 
> Page not present, read fault. Please disable obfuscation of kernel 
> pointer addresses by printk. Maybe also disable address space 
> randomization while debugging this.
> 
>> This call works almost fine (I still have the assert failed: 
>> folio->private != NULL issue).
>>
>> And when I call it a second time, I get:
>> bash-5.2# ls
>> [   19.820000] do page fault:
>> [   19.820000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700e2004, 
>> 2, (ptrval)
> 
> Page not present, write fault.
> 
> It would be helpful if you could get a dump of /proc/1/maps before the 
> execve() syscall in your helloworld init replacement. That might confirm 
> all these addresses are legit (assuming mappings survive across 
> execve(), that is), and what they correspond to.
> 
>>
>> The address corresponds to the defined zone ELF_ET_DYN_BASE as I set 
>> it to 0x70000000.
>>
>> regs->pc is not the same as the address. It might be unrelevant, but 
>> any help is appreciated to understand the process behind :-).
>>
>> I keep digging, and I am in the asm part which fears me a bit !
> 
> I don't see that you'd need to look at any asm code here.

I add a small test in do_page_fault, and in case of an error, it panics. 
The result follows:
  ./scripts/decode_stacktrace.sh vmlinux < /tmp/trace.log
[    3.857000] Run /bin/bash as init process
[    3.858000]   with arguments:
[    3.861000]     /bin/bash
[    3.862000]   with environment:
[    3.863000]     HOME=/
[    3.864000]     TERM=linux
[    4.242000] do page fault:
[    4.242000] regs->sr=0x2000, regs->pc=0x41366924, address=0x700b3364, 
2, 41fb0000
[    4.242000] Kernel panic - not syncing: page fault error
[    4.242000] CPU: 0 PID: 1 Comm: bash Not tainted 
6.10.0-rc5-g927da6cf01fe-dirty #25
[    4.242000] Stack from 4186dda8:
[    4.242000]         4186dda8 41423aa4 41423aa4 700b3300 00000001 
00000000 4136ee10 41423aa4
[    4.242000]         41366d7a 700b3364 700b3364 00000000 0000000d 
4186de60 41fb0000 41d51a60
[    4.242000]         41005696 41416a90 41416a4d 00002000 41366924 
700b3364 00000002 41fb0000
[    4.242000]         0000000a 700b3364 00000000 0000000d 00000012 
41d51a00 4186de60 41d51a60
[    4.242000]         41fb81c0 41d51a60 410052fe 4100529a 4186de60 
700b3364 00000002 00000000
[    4.242000]         700bc414 00000003 00008000 700ac000 41003660 
4186de60 00000000 00000000
[    4.242000] Call Trace: dump_stack (lib/dump_stack.c:124)
[    4.242000] panic (kernel/panic.c:266 kernel/panic.c:368)
[    4.242000] do_page_fault (arch/m68k/mm/fault.c:88 (discriminator 1))
[    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
[    4.242000] buserr_c (arch/m68k/kernel/traps.c:725 
arch/m68k/kernel/traps.c:775)
[    4.242000] buserr_c (arch/m68k/kernel/traps.c:748 
arch/m68k/kernel/traps.c:775)
[    4.242000] buserr (arch/m68k/kernel/entry.S:116)
[    4.242000] ma_slots (lib/maple_tree.c:759)
[    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
[    4.242000] elf_load (fs/binfmt_elf.c:125 (discriminator 1) 
fs/binfmt_elf.c:421 (discriminator 1))
[    4.242000] load_elf_binary (fs/binfmt_elf.c:1132)
[    4.242000] memset (arch/m68k/lib/memset.c:11)
[    4.242000] load_misc_binary (fs/binfmt_misc.c:97 
fs/binfmt_misc.c:146 fs/binfmt_misc.c:213)
[    4.242000] memset (arch/m68k/lib/memset.c:11)
[    4.242000] bprm_execve (fs/exec.c:1797 fs/exec.c:1839 fs/exec.c:1891 
fs/exec.c:1867)
[    4.242000] copy_strings_kernel (fs/exec.c:669)
[    4.242000] count_strings_kernel (fs/exec.c:473)
[    4.242000] kernel_execve (fs/exec.c:2058)
[    4.242000] __dynamic_pr_debug (lib/dynamic_debug.c:865)
[    4.242000] run_init_process (init/main.c:1389)
[    4.242000] _printk (kernel/printk/printk.c:2365)
[    4.242000] kernel_init (init/main.c:1508)
[    4.242000] kernel_init (init/main.c:1459)
[    4.242000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
[    4.242000]
[    4.242000] ---[ end Kernel panic - not syncing: page fault error ]---

Looks like a memory mapping failure, but why ?
My JTAG at this point dumps a list of 0s at 0x41fb0000 and my SDRAM 
starts at 0x40000000 and ends at 0x50000000 (256MB).

It looks like a TLB write miss which is obscure to me :-).

I tried to use the /proc but as expected it is not alive after mounting it.
Thanks,
JM


> Cheers,
> 
>      Michael
> 
>>
>> Thanks !
>> JM
