Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433F1CA87
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Apr 2024 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712342196; cv=none; b=q3abTi4jnPgt1099wOQNcglokb3E9stKlG1Cm7HpHg1fcPXkXE53afrdPuT5vKt/Esd/DqjhWHTOVUDSxSVBTwhi/lrtYZKSUKLrg7rZKjFNC/dj7CLrSEsmO18vY1j0E4cHV2lDsCH0gRjy7QGnhy8a5Wsfq6LgjSXiS1XJVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712342196; c=relaxed/simple;
	bh=8gvjGMkKW7jL8578d1YpBLUgBk6nMTdbMF3USz8QBVs=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bP6mtKnK/oKPrsW48j2sO8zoW/L75tpUNcEDH0Uxla/oCxu/IhVFGUy1k66ThXIchKz1dX6UTa+tLlN/xqroPsM70PwxHtHvBHEE3XePtpOVyd0G/PbH+FXD1qIuFSHUhNa0qSfC0i1hk4/J39f6esLi7QzGoGWnNOulLsqyBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keCIRkCT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keCIRkCT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e2987e9d06so21485945ad.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Apr 2024 11:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712342194; x=1712946994; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYwm+/heEjBobI2C1/8dBjrC19orKej+qKNwaThEwgY=;
        b=keCIRkCTmYmcS9xlMV5/B4/Zaf+B4+0qDjtF754pT+8XRL/0OdKl5kwKnvgSWmjx3J
         N88vzhToTOun0Y9xBBRnp9H1s9TLU7OrUvg6Nm8EbSBU6QClmoLlJJWJoLV+iC6BA3ge
         lLiQA2sZmRIswGIr7YBVj3O/VaDqPqR9ZR4UoKr7JfXHmfxs2LnKn3xM9Fxz2rnsxMVO
         P8gq0RKhWCeYqfbwJzjlJyMhk3VV93S7JaI8YWOC1s1Rri8qefuRLIMVTp93XjmqJJJ2
         MdL06+TB7vR0B0Qfy6VXgsYN/qdRx18QLmS8zeqMlPRwry2FopLiZKJlqDZ9/sWHxki/
         LnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712342194; x=1712946994;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cYwm+/heEjBobI2C1/8dBjrC19orKej+qKNwaThEwgY=;
        b=wuUHUIHoew3nm/D3xeLShYanIQs1+9jNac2AvDwlUBnK1hDmlUnWcbfDDkV8ScRJ2m
         q73FRsjGfWGAWZuZ8BTA7d3DHYP6YJyZQ3wX0qh2PLzZ86ikRZbNVTJYqLXVHPhh3rW0
         GOnwTvjWT2denCE4PXnTYhRVSUXcnCglymT99AgTBiLrKNWRSsJO6FPWYGC8X6WPZTs2
         mzYaC6RVzXBY1Oty0tKoYG6l0r1wweK+cANDL/qjHCASKQWW7vcgvwLLLiaCh6DWymWS
         W7Y/ZkYTeew5onlXvlQDj7aujoi250eofzu4TAB1Hhylzs36cl6j1tYd/qe4KOaImCx3
         DHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX8bTMS6jnWNBt+mPC8SDt40s4opzyg2ft3vtE7cmNdvfC2K1TFMLmj+f9c3qmy4xqcYu3HF10bgQZCPqKchwiE2dFdd32+gJ1gkaHymt0
X-Gm-Message-State: AOJu0Yy+mIGE5SWxjfszrVaVymWS7T0rwg/8WgPfEhFg+wJ+cHHtXJMU
	tnoDi40VcHjyqekN6NSmrzyX6T+n7qaiHz5v0YiebxBA2pyPUQNd8u/KOCke
X-Google-Smtp-Source: AGHT+IH1asEwBguA0fEhDIITjnTIlpieh0IXeZVXpZy1/jO0JTKJ2hGsYzLlZIY66T4GAqZK8y0xaw==
X-Received: by 2002:a17:902:da87:b0:1e2:a31e:5e12 with SMTP id j7-20020a170902da8700b001e2a31e5e12mr2431854plx.3.1712342193933;
        Fri, 05 Apr 2024 11:36:33 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id b2-20020a170903228200b001ddd6ba8113sm1907340plh.207.2024.04.05.11.36.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2024 11:36:33 -0700 (PDT)
Subject: Re: [PATCH 0/1] m68k: Handle HAS_IOPORT dependencies
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
References: <20240403122851.38808-1-schnelle@linux.ibm.com>
 <dd55afa6-8cb6-4e25-b720-d2df62dbb5e6@gmail.com>
 <bf276f98-2712-4fcf-a119-f984a1aedbf2@app.fastmail.com>
 <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-m68k@lists.linux-m68k.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d9bdfa48-572a-caa1-229b-44565690d9e6@gmail.com>
Date: Sat, 6 Apr 2024 07:36:26 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

Am 05.04.2024 um 23:16 schrieb Geert Uytterhoeven:
> Hi Arnd,
>
> On Wed, Apr 3, 2024 at 8:35 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Wed, Apr 3, 2024, at 20:11, Michael Schmitz wrote:
>>> how do you propose we handle legacy drivers that do depend on
>>> inb()/outb() functions (_not_ actual ISA I/O) on architectures that map
>>> inb()/outb() to MMIO functions?
>>>
>>> (In my case, that's at least ne.c - Geert ought to have a better
>>> overview what else does use inb()/outb() on m68k)
>>
>> If a machine provides an inb()/outb() set of operations that
>> is actually used, it should set HAS_IOPORT.
>>
>> For the Q40, it may be better in the long run to change the
>> drivers to just use MMIO directly though.
>
> Q40 uses ISA.
>
> Michael is worried about non-ISA drivers using inb() and friends.
> At some point in time (i.e. eons ago), we were told it was better to
> use in[bwl]()/read[bwl]() instead of directly dereferencing volatile
> pointers...
>
> Anyway, I don't think we have many users of inb() and friends left, and
> I assume the bots should have detected any/most remaining users in Niklas'
> branch...

All the 8390 based ethernet drivers still use inb() and friends.

That is the main reason for the terrible hacks in 
arch/m68k/include/asm/io_mm.h ...

The last time I tried to add support for a different PCMCIA ethernet 
adapter to apne.c _without_ adding to the hacks in io_mm.h, I wasn't 
getting anywhere with the netdev crowd. That was ages ago, and I doubt 
their enthusiasm for a rewrite of the 8390 code base to avoid using 
inb() on MMIO architectures will be any better now.

Just saying ...

	Michael

>
> arch/m68k/include/asm/floppy.h on Sun-3x might be the only offender?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
