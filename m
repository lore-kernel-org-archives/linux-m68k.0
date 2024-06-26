Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002A158A06
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719385322; cv=none; b=F+UUW6zkaC+6N7FFLOFd69RQ1YaKVTEEeNFhQoHX39cZI0KWdp9vNjdb/s9CM05L77tC9MzxZNacVCDhv/sVGNZAM1g1CRoTyGHzNEOYOR0tq5cfCuY7f/geHihncJdhESFM27jHOjwJqCPOAak/qZOoqv4R8ic9uNNL88BUs3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719385322; c=relaxed/simple;
	bh=Pwzdw3aKwjnUTSlL/BpSDBfHkoAZ594NvyTn+W7rr2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNek5v17EdymAKhMWV6c1eVumGXUBXfQr7bHKsMr/LGwymTthHuQfa6B79gBFXDut+IW5xAEBxu8ndA9k08SpwND3ds1zh60fAvlkxGzK+ZBO2tmJOXTRjP2H387WEucAJn5BKQ5ssZ8SY7MVX5JHUpzt6edwFerQUQ4LJgaQrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=MnExD+aE; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="MnExD+aE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB1ED20005;
	Wed, 26 Jun 2024 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719385312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgymRYe2dqU8fBB3otXS5Br4T7l5iIT81ij+B9BaWxI=;
	b=MnExD+aEui4RXmO/hP+c7+nqiCCePlKTHhK0LVgd7Vtv8BvX1ivfJEwk34yKnZKhmG2ybD
	78fpHjf7hniw+UH+fY5kLIerZOD5H1RjmG1/39G4MMG9d6Pfw1qrBQBPcDnnJKnfF8KQEH
	GgZotyLAI9rhbPMNZofwvIdMuqEc9xbgnZDWd/6rwTHa5UcSUnyoes2lAQIBX597vLOfqO
	2eJsCb2FsXd3BZMgS7CLg7+o57L4oQFBo8+rscIOyn4zQBKBbDgx4rmt/VHuQy2fextxuZ
	ZyuRuQlm+LQqrTRzYC9kgldaNf+UXsDcVYiEpKKT7fFLePL1g8FwWADtc873/A==
Message-ID: <d1536f25-6c4a-4696-974e-1119cf2a6da3@yoseli.org>
Date: Wed, 26 Jun 2024 09:01:48 +0200
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

Michael,

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

I changed the code a bit, and display an error only when error_code is 
not 0. The result is for the bash launch:
[    3.864000] Run /bin/bash as init process
[    3.865000]   with arguments:
[    3.866000]     /bin/bash
[    3.868000]   with environment:
[    3.869000]     HOME=/
[    3.871000]     TERM=linux
[    4.250000] do page fault:
[    4.250000] regs->sr=0x2000, regs->pc=0x41366984, address=0x700b3364, 
2, 41fb0000
[    4.258000] do page fault:
[    4.258000] regs->sr=0x2000, regs->pc=0x41366984, address=0x6002140c, 
2, 41fb0000
[    4.273000] do page fault:
[    4.273000] regs->sr=0x0, regs->pc=0x60011996, address=0x6001ff74, 3, 
41fb0000
[    4.332000] do page fault:
[    4.332000] regs->sr=0x10, regs->pc=0x60012bf4, address=0x700adf44, 
3, 41fb0000
[    4.497000] do page fault:
[    4.497000] regs->sr=0x0, regs->pc=0x60016344, address=0x600592d0, 2, 
41fb0000
[    4.505000] do page fault:
[    4.505000] regs->sr=0x10, regs->pc=0x60007320, address=0x60055f54, 
3, 41fb0000
[    4.533000] do page fault:
[    4.533000] regs->sr=0x0, regs->pc=0x60016344, address=0x60066244, 2, 
41fb0000
[    4.539000] do page fault:
[    4.539000] regs->sr=0x10, regs->pc=0x60007320, address=0x60065f54, 
3, 41fb0000
[    4.635000] do page fault:
[    4.635000] regs->sr=0x0, regs->pc=0x600098d2, address=0x60068014, 2, 
41fb0000
[    4.637000] do page fault:
[    4.637000] regs->sr=0x0, regs->pc=0x60016344, address=0x600a2d1c, 2, 
41fb0000
[    4.647000] do page fault:
[    4.647000] regs->sr=0x10, regs->pc=0x60007320, address=0x600a1f54, 
3, 41fb0000
[    5.163000] do page fault:
[    5.163000] regs->sr=0x0, regs->pc=0x60016344, address=0x601d1d28, 2, 
41fb0000
[    5.175000] do page fault:
[    5.175000] regs->sr=0x10, regs->pc=0x60007320, address=0x601cdf44, 
3, 41fb0000
[    5.212000] do page fault:
[    5.212000] regs->sr=0x14, regs->pc=0x6000b04a, address=0x601ce004, 
2, 41fb0000
[    5.373000] do page fault:
[    5.373000] regs->sr=0x14, regs->pc=0x6000b04a, address=0x60056004, 
2, 41fb0000
[    5.396000] random: crng init done
[    5.401000] do page fault:
[    5.401000] regs->sr=0x14, regs->pc=0x6000b04a, address=0x700ae004, 
2, 41fb0000
[    5.414000] do page fault:
[    5.414000] regs->sr=0x0, regs->pc=0x6000b42a, address=0x700b0000, 2, 
41fb0000
[    5.487000] do page fault:
[    5.487000] regs->sr=0x0, regs->pc=0x6019cbf0, address=0x601d5010, 2, 
41fb0000
[    5.488000] do page fault:
[    5.488000] regs->sr=0x0, regs->pc=0x6019cbf6, address=0x601db288, 2, 
41fb0000
[    5.552000] do page fault:
[    5.552000] regs->sr=0x0, regs->pc=0x600e1032, address=0x601d21d4, 3, 
41fb0000
[    5.569000] do page fault:
[    5.569000] regs->sr=0x0, regs->pc=0x600df938, address=0x700ba8e4, 2, 
41fb0000
[    5.580000] do page fault:
[    5.580000] regs->sr=0x8, regs->pc=0x70038476, address=0x700b4890, 2, 
41fb0000
[    5.634000] do page fault:
[    5.634000] regs->sr=0x0, regs->pc=0x6011cbf2, address=0x700be004, 2, 
41fb0000
[    5.677000] do page fault:
[    5.677000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700c71b4, 2, 
41fb0000
[    5.684000] do page fault:
[    5.684000] regs->sr=0x2004, regs->pc=0x410a724a, address=0x700c0000, 
2, 41fb0000
[    5.686000] do page fault:
[    5.686000] regs->sr=0x2004, regs->pc=0x410a724a, address=0x700c2000, 
2, 41fb0000
[    6.058000] do page fault:
[    6.058000] regs->sr=0x10, regs->pc=0x7004b63c, address=0x700b8d2a, 
3, 41fb0000
[    6.206000] do page fault:
[    6.206000] regs->sr=0x0, regs->pc=0x700365d2, address=0x6005a468, 2, 
41fb0000
[    6.231000] do page fault:
[    6.231000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700c483c, 2, 
41fb0000
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
[    6.327000] do page fault:
[    6.327000] regs->sr=0x4, regs->pc=0x70092344, address=0x700bc410, 3, 
41fb0000
[    6.349000] do page fault:
[    6.349000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700c80f4, 2, 
41fb0000
[    6.438000] do page fault:
[    6.438000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700ca114, 2, 
41fb0000
[    6.452000] do page fault:
[    6.452000] regs->sr=0x8, regs->pc=0x600f28d0, address=0xbffcfd4c, 2, 
41fb0000
[    6.481000] do page fault:
[    6.481000] regs->sr=0x0, regs->pc=0x6008b6a8, address=0xbffcd1a0, 2, 
41fb0000
[    6.493000] do page fault:
[    6.493000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700cc474, 2, 
41fb0000
[    6.516000] do page fault:
[    6.516000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700ce1bc, 2, 
41fb0000
[    6.517000] do page fault:
[    6.517000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700d000c, 2, 
41fb0000
[    6.519000] do page fault:
[    6.519000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700d246c, 2, 
41fb0000
[    6.520000] do page fault:
[    6.520000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700d42bc, 2, 
41fb0000
[    6.528000] do page fault:
[    6.528000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700d6004, 2, 
41fb0000
[    6.543000] do page fault:
[    6.543000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700d8584, 2, 
41fb0000
[    6.544000] do page fault:
[    6.544000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700da3d4, 2, 
41fb0000
[    6.546000] do page fault:
[    6.546000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700dc224, 2, 
41fb0000
[    6.547000] do page fault:
[    6.547000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700de074, 2, 
41fb0000
[    6.576000] do page fault:
[    6.576000] regs->sr=0x0, regs->pc=0x6011ca12, address=0x700e02c4, 2, 
41fb0000
bash-5.2#

My kernel is loaded at 0x41000000.
JM
