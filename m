Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4DA143C70
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380144; cv=none; b=C/vMLTmGBotqWWz9KsoQyZFsNDP7dugVewbFzv5sv0pySffy64IOpPQUi+3a+xSs2ymCudwhjC5Y9TM/dXPJyrYQd7T5J7TFThZE11cgaRZ3FeOxcDLfbK6x0dTWTon2ETStCBLih3Z8qZWmDUDWCMutZIA2t09NI/qFRxWGVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380144; c=relaxed/simple;
	bh=AHQfH9bi99pW2HC1yAq6bwSN+5OGOmkk1MnLhBEamxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lY2DTrfKd5IR6HFB1lNX/eNYnXStHw0T1uMPyc9FRZU622iyLRV1xPokvPsnKHcw8ZlStHgtXOp6FXEYmwGcLn48YWCu+Yhd02IHh4jLxE0ZICUVXxXp87wmMS5i1upMyTEalhl2VQosTy/X3JYkgUl0qpSZK+qCD2N1X6oWmtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=MXOxUJki; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="MXOxUJki"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C315FE0005;
	Wed, 26 Jun 2024 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719380133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTBLI+EibBIM/islvmqEb9vNuvgw5disz9PcbN3jy0U=;
	b=MXOxUJkiDj/W/7OpA7Qvdj6LdARFfF+IyMRGQdcVUZJ94s7YmB9xyJLrhmSjDBMIXIptPX
	oUSTivbIk9cwF0O3zgn6QkfyaKm3VXmKbUGeyTfU26oHdHyk4qTn8G3HMChlIqCYv8Obtp
	6vYWb4t2FvFbuSz8u2Sv/RlPCeuzYv8//5dBGzUMAYmab0o7QxS8V05QjOfL4JRgR7nqam
	wXnq7g4LaVgcJfbhN1pPNBw4ohD8/x48oUh/n5LOKerbMZpG5pZbMt2mTxERVhcs/iVGKS
	bH14rDlauJhAkNb4UAJBMV1hLThSVBcSrvHWjzvF1I5kxUuL1C6LbdlQj7xKDw==
Message-ID: <8e62f256-b136-4a70-9915-cf979fab5dd0@yoseli.org>
Date: Wed, 26 Jun 2024 07:35:30 +0200
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

Randomization is disabled, I think I don't have hash pointers... Will 
heck again, thanks for the explanation.

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

Executing mount /proc will make it impossible to then call cat 
/proc/1/maps :-(. Can I enable a printk somewhere in the kernel to do 
the same maybe ?

JM

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
> 
> Cheers,
> 
>      Michael
> 
>>
>> Thanks !
>> JM
