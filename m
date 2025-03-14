Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BA17E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943174; cv=none; b=m3rJnrbNbZr65TTWNOs2ndUiKzGJOq6okRGeAP16LNw7QXuiCLjY6Wa8I+x9If5iMPNLSNlXhwgDyf9ecXUjnW0IZyHl/lPjQTXv5G16Cbfc8BYH/U0YtcOYm/kB009gF6jSC+5qhP6Puad9cye6yHyDiLedWOeYLSFX4ioqqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943174; c=relaxed/simple;
	bh=od3nCjo2qBKWAJvaV62Z9ANIB8QEUnVwCIEzjEUrSfU=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=G2Xc082fl3D1Iavp9IXt+E+7/EIaBBbwk1Ms/ab42hBr42eEqoiFUf3HXuSCirM6yXMyuplb0/7qttZKg2K+Fhs+5gHSZe3VAPFKHtJi6cBH2sMYADUyyVFjsQgER1nnHQfjXjE8SvOgxMm4gtyGOqy2dhb5hm4lz/7F9QpK1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQNoxsjs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQNoxsjs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22349bb8605so40828625ad.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741943171; x=1742547971; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfChh9ipBXZrSuNgy0h2l478KO4tpAhGxE2UGXttOdE=;
        b=XQNoxsjsCmMotD5he7TaYyh6tzd6e2AiMOt8j4lybaQ+NPyXP+vHmOyzlhkYn0+A8b
         hMYEjO+MKWhUr6P+uHtTl5lftFPJ/4iWrMC/l8CVMsFh/IeeTxQV+q9wUkwpkggT7EE9
         +gog70oUtqvtPNLX53oge1D33FdLtkbcjokyzA8zsix7Ifan3Uxopcg1w4wTiMciSWOS
         4mghZQeCI86zj0YU36unx+X8DqSM3OyGmtvfRf96eFVrt1nJJZJRk4gNgl3Ry7MtI5iZ
         jFBu9IzJnuFCK2Gl4SMk7OOccFCh8sy4Af6dS/PlkOSFShE96Z7WUjtQoEfj3D0ZQqgL
         U7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943171; x=1742547971;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfChh9ipBXZrSuNgy0h2l478KO4tpAhGxE2UGXttOdE=;
        b=Wbb8QWFvCjvcQ7O9uuRXvui2R2FS7f3V9YRZKAwQ6jRA/1JpI5emDWQ6dZQ/en4GPg
         ivjnunZzWgxyRZXkZsfltjJftzgqtH3N0L0oG+vBpGQFp9THIpwUM36bUp5mpCXVi274
         hbyKgLjOtqjnyMKzRaCpQ9oYBKCGMJZPfSY+7QaQxA1d9zJm+pLYpz0Zln24Ozkc+9vj
         iUFIS6xHe6EkGKoJMs9QCvbD6fvy9iIQqOytF8HjoM0ljnT+1va0aQ9TnreKPfD1pZdS
         mqQ7fBgM12TVizIM+N7WBPeQlfGwNVWWDIM1QmOH/B0TJfbLvLiipwHz6aZKvhekDczw
         wTCA==
X-Forwarded-Encrypted: i=1; AJvYcCW2W+c+vZSeMdZGVC6AB2Cc8F/+LcwtY+QC44qAmXB3L2INbJkc2xspMUUIg5KX8eXR/ikDP0q26vRn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzCKGoRyhP/qGxmAPT8TzyhQtmFJR8fchgBDMhRjyH8UmWCrOzc
	ezJtI2krxlZhNnd46Om7Eok9urB4GGVcW2EXzpBQ2sEOalIF+9sMgCqkDw==
X-Gm-Gg: ASbGncsdtoZ3mnzGFTS1nMcsaBRoJ3kF1vxWA9z/9sN1z0I7ratQfHAfyco09Yn9Bm1
	cDkTENRza38980/OywXX7xaHuBnuKn3+/CF3f3bxY5/HDYVxECI/KiYG07OAlewdmraHxQhokwt
	cEpII91Qm4jUVmVE5FKXFunH3F9GwkgWKuCZX+q7FkXj3SD8WdcxXRwuHgqNVymhcPGoj0d7DUD
	1xqZHThkAyOaV0kjYVPV67L46y55Kd84JAjwOgLmjBXOkeFlT863nnIMc/0/gB046z/dREJ5YzI
	RDznWIJQMNSlMgIpOcCoe8bmOejs1jSVU20ARDM0F14G4V0AbVVVa7o9D9e1u0SIlePiP5ddQnP
	mF1E=
X-Google-Smtp-Source: AGHT+IG5xa3cV819SorR/yCQPSyYU5CGnI6VTsV2+X3j9TRck44wC3OYjGC3h8TsVzXyIiG+FFRZEA==
X-Received: by 2002:a17:903:292:b0:224:26f2:97d6 with SMTP id d9443c01a7336-225e0aae36amr27731925ad.28.1741943170953;
        Fri, 14 Mar 2025 02:06:10 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-71-fibre.sparkbb.co.nz. [222.152.170.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888d9bsm25204365ad.49.2025.03.14.02.06.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Mar 2025 02:06:10 -0700 (PDT)
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org>
 <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
 <ea797cf9-99b7-434a-91e2-41dc1aa4c131@gmail.com>
 <CAMuHMdV8kBcxjy7TUKDR-yxhk79umhrRp+L8wrk8BO6N2F4iyw@mail.gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <bb27d358-2854-e31b-52a0-a9a5a89ac168@gmail.com>
Date: Fri, 14 Mar 2025 22:06:05 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV8kBcxjy7TUKDR-yxhk79umhrRp+L8wrk8BO6N2F4iyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

Am 14.03.2025 um 21:51 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Thu, 13 Mar 2025 at 19:32, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 14/03/25 04:51, Geert Uytterhoeven wrote:
>>> On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
>>>> On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
>>>>> On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
>>>>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>>>>
>>>>>> The point where the memory is released from memblock to the buddy allocator
>>>>>> is hidden inside arch-specific mem_init()s and the call to
>>>>>> memblock_free_all() is needlessly duplicated in every artiste cure and
>>>>>> after introduction of arch_mm_preinit() hook, mem_init() implementation on
>>>>>> many architecture only contains the call to memblock_free_all().
>>>>>>
>>>>>> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
>>>>>> relevant architectures to make it more explicit where the free memory is
>>>>>> released from memblock to the buddy allocator and to reduce code
>>>>>> duplication in architecture specific code.
>>>>>>
>>>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
>>>>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>>>>   arch/m68k/mm/init.c          |  2 --
>>>>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
>>>> Thanks :)
>>>>
>>>> While working on this I was wondering if init_pointer_tables() can be moved
>>>> from mem_init() to motorola::paging_init(). It seems to me that it can, but
>>>> I wasn't sure enough so I left it there for now.
>>> Oh, that would be nice, as it would allow us to get rid of the ugly
>>> #ifdef, and (in the context of this series) of our own mem_init().
>>> It looked promising at first, but crashed later (on ARAnyM):
>>>
>>> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
>>> devtmpfs: mounted
>>> Unable to handle kernel access at virtual address (ptrval)
>>> Oops: 00000000
>>> Modules linked in:
>>> PC: [<0001273b>] xdnrm_dn+0xf/0x10
>>> SR: 2208  SP: (ptrval)  a2: 01030000
>>> d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
>>> d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
>>> Process swapper (pid: 1, task=(ptrval))
>>> Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01
>>
>> What's at that address? The 14 MB ST-RAM ought to end at 0xe00000 (which
>> would have been left unmapped if FastRAM is in use). MMIO area starts at
>> 0xff0000 but base addresses there are 0xff8xxx, 0xffaxxx or 0xfffxxx
>> from what I've found.
>
> As paging_init() is done much earlier than mem_int(), I guess it just
> failed to mark the initial pointer table as reserved, and scribbled over
> it later, so I wouldn't trust anything in that backtrace...

That wasn't from the backtrace but from the exception frame. I'd hope we 
can trust that one ...

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
