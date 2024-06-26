Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EE11184
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719366967; cv=none; b=MvPz/XZOhWeDlNH+/XKye3nlD6WfibL11/M2JS6h/fmdDM9ZoiMHwFeAlOyQgzUBIaKH1YMqNZBRi4tVouc3xEo+2920XIo4+LJRU4a86BdI1CaGPF7WQqJQF+kGNcq5y+eMb4OP5YfxxLAQensU3Y6Tb/XLe8fSSbysH9mCWVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719366967; c=relaxed/simple;
	bh=ZVnSz7t9HS/xVkSQFeohumw/CAI8e0QGMpZZ7eiyFIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz5TPH7S6JPDwYM86exRh0nWd0euvpTjdAcM/ZkDJOhR590Z0VHe+Iq2hzRp4Wr7FwcDU947t2ZvwpPp3DAKcC2RPVxDrMvdtumKljN3AwijskUp1MFxQGdnEd1GlJK/3GmIQDimj2xLUgy+XKKyyrD4eGVE10GutFVt3JyEN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTT25nBH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTT25nBH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70665289275so50540b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jun 2024 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719366965; x=1719971765; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rbul1fR3L9u5waML0BaNr19XP8U9Sm981YRGSDMC6ws=;
        b=fTT25nBH0jqIFXjfAcozpJQLdGHfQ8FJnXqmD8Jd9l2OIeCSXLrGVHu/9VgcIoYkju
         AD9R5JDMwcr0Bv7XYE2rBzvlxJO0qKDHqUeZS3/5m3wQu2/wI6g4Wgi3+cxxV7OaLTtM
         jYHrIUU7FnOv5XnMIw86mZVyfm8DPq8x//FUu/4LHovlWKVhUHlJd7BrVBmX/1aoL0RB
         60wn7/wCtbwntoUI8HMimkxsmYB3+o4O2+FjYqw4yRwTXj95DlOVpeHhuNWn+rVVdp6a
         ndZSbF1C+8/aujyEv/sXQzggZUiJd0Noxfg/0otVQZiPQsVJscmZG5DUNbBsjyLsy4Pk
         UDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719366965; x=1719971765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbul1fR3L9u5waML0BaNr19XP8U9Sm981YRGSDMC6ws=;
        b=niSdu7BnqCtsYU4gJjUI/XDYN+dbPooomcWZrkOnCPCKXoPXovtvMkIQpuQDCrfTRR
         QUZQZQxgGi122r0DBj9ie/IFl94cDIlit3nesFFqylRW+c3V4P2qsRShQxBM+WvtQY5Z
         vxjAsrBILRqn755Sus5Ifeom0S842byVV2HnzLBZW4wm9YbSsSaOxvqQqFN7n/uxfk5t
         ZpqI5R/L963f9RpjixYTsNGqIe2SSz02ym+adXj2sjqtHGbmx2LCn382TZ8svLDLjmBa
         k885/mGfVbzjHcjI6ptkNMg9dGNtv7Ic3slUgBYxvTLANroH37RWfacs0Ez2RFBujKVu
         wOLA==
X-Forwarded-Encrypted: i=1; AJvYcCUz6M54EZf/+ZxR4COdUxZ63fccQ1ran9674AtLpz/Wq+ZJSkBxkBZgBLBfpUUaZVShN6JnAZJqtLwCAwI1rXO4hl/cqMaw27yis9JbKcwF
X-Gm-Message-State: AOJu0YyWaBU7tE8gnRvzZPSt4jNGkt5uepL4SSmzyq5aH4UIAU/9k4p9
	TzUP0lCOnVAyxAGiu1XAwq7GCEYvd4Ym7KJGGC/uG5NSxvqnqazV
X-Google-Smtp-Source: AGHT+IFIcdxLk083jRZ/4PdrczkMPVC9KQrKPQLOfWqwCJrZa6lA8bz/dBQ1GMss9TVp5xyclZQTew==
X-Received: by 2002:a05:6a20:bca7:b0:1be:6390:33ee with SMTP id adf61e73a8af0-1be63903715mr354342637.0.1719366965334;
        Tue, 25 Jun 2024 18:56:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:59f2:64c2:bfe2:faa2? ([2001:df0:0:200c:59f2:64c2:bfe2:faa2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-71aa50d2809sm4712144a12.11.2024.06.25.18.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 18:56:04 -0700 (PDT)
Message-ID: <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
Date: Wed, 26 Jun 2024 13:56:11 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jean-Michel,

On 24/06/24 20:56, Jean-Michel Hautbois wrote:
>
> When I printk the do_page_fault first debug, I get for the first call 
> to ls:
> bash-5.2# ls
> [   14.700000] do page fault:
> [   14.700000] regs->sr=0x0, regs->pc=0x70069ee6, address=0x70069ee6, 
> 0, (ptrval)

Page not present, read fault. Please disable obfuscation of kernel 
pointer addresses by printk. Maybe also disable address space 
randomization while debugging this.

> This call works almost fine (I still have the assert failed: 
> folio->private != NULL issue).
>
> And when I call it a second time, I get:
> bash-5.2# ls
> [   19.820000] do page fault:
> [   19.820000] regs->sr=0x0, regs->pc=0x6011d65a, address=0x700e2004, 
> 2, (ptrval)

Page not present, write fault.

It would be helpful if you could get a dump of /proc/1/maps before the 
execve() syscall in your helloworld init replacement. That might confirm 
all these addresses are legit (assuming mappings survive across 
execve(), that is), and what they correspond to.

>
> The address corresponds to the defined zone ELF_ET_DYN_BASE as I set 
> it to 0x70000000.
>
> regs->pc is not the same as the address. It might be unrelevant, but 
> any help is appreciated to understand the process behind :-).
>
> I keep digging, and I am in the asm part which fears me a bit !

I don't see that you'd need to look at any asm code here.

Cheers,

     Michael

>
> Thanks !
> JM
