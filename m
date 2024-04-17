Received: from welho-filter1.welho.com (welho-filter1b.welho.com [83.102.41.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0CB84D21
	for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2024 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342385; cv=none; b=m0frnllpWvyyldsXA8ql4Wj7E1i7CtP5UhDY7CPMWpSmTdrf1pqxVJS4h4XYaSNyjJXH+dyVIqUBE1XJX0w2/5Mmjsg4KDQMv8oaavgK3LL+0TOkrRavlRJHa9CyLZzwBgFMVKkKZJTsa61JRh1QMP34ZlqaT4xPmFQgOyv2FCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342385; c=relaxed/simple;
	bh=M9CGWwZFFJ7wZNDmuesgkNzmLoQD8nTnDJreqT8nKxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pB6JnNCTMdNj3XUxWpz1ES/Uw2wkqpDP5LC1C+CElsT04LbDFk4LLiuTcGQvcAkYtIbSHoQoJ2nFN+w5IPwfqQEY6mHtK2Ejtjdf4AoZtEKMJqqWt69lA1r5+mEESPFul/gwqnJp/wapgaZ27MpvxmaLn/FhU4FKXYtRGw+UTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter1.welho.com (Postfix) with ESMTP id 9CF4421957;
	Wed, 17 Apr 2024 11:17:03 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter1.welho.com [::ffff:83.102.41.23]) (amavisd-new, port 10024)
	with ESMTP id PsshzysWVxiJ; Wed, 17 Apr 2024 11:17:03 +0300 (EEST)
Received: from [192.168.101.100] (87-92-40-241.bb.dnainternet.fi [87.92.40.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id 1F7F02309;
	Wed, 17 Apr 2024 11:16:58 +0300 (EEST)
Message-ID: <71553982-6353-4786-9d12-fb83ea1b87a7@helsinkinet.fi>
Date: Wed, 17 Apr 2024 11:16:57 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org
References: <20240416203643.3390-1-schmitzmic@gmail.com>
 <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17.4.2024 9.59, Geert Uytterhoeven wrote:
> On Tue, Apr 16, 2024 at 10:36 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> I have tested this fault scenario with a transfer beginning
>> at a single byte at the end of a mapped page only, which IMO
>> does violate m68k alignment rules. I cannot remember ever
>> seeing such faults reported from conforming software before.
> 
> 68020+ does support unaligned data accesses, so IMHO such transfers
> are valid.

But is that valid also across page boundaries?

I vaguely remember (from 15-20 years ago) there being ARM errata about 
some things being undefined when doing unaligned 16/32-bit data access 
across page boundary, so maybe it's not so clear cut on m68k either?


> For compatibility with 68000/68008/68010/68012, data is
> recommended to be 2-byte aligned.
> Instructions must always be aligned to 2 bytes, though.


	- Eero

PS. Quick googling found following ARM spec comment "a watchpoint might 
be undetected if it occurs on the second part of an unaligned access 
that crosses a 4K page boundary", but I remember issue being not just 
with watchpoints back then.
