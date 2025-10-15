Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B376244692
	for <linux-m68k@vger.kernel.org>; Wed, 15 Oct 2025 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536420; cv=none; b=LqnrRatqubeCkC8v90A15JzVnCO0nZsuEbZ/hzLCm566QGLmqFoKKa8eBooFldYAck6SrjhbFMOAI54Mw+35MnKq3E7o18URMwDQDPi0Ce4iB71tcqob6PZ/7xI97/mw/8ZGsDcz8yQrmpfgOrfyDRBLTCT3E3/oletOxwch+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536420; c=relaxed/simple;
	bh=nAMaEtaGYdQF7zxrims38eySXuR9N44DgyDjL/b4jdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDQkeStOJ0Av9yE3mn6yTlfdZwvBYMcFXTHWrfeaSUp8ilgBnlUUzr5caZWOZJTRhtXbDpGmOgt9+XH3Dx3bamjjNVX76pd5Gb3j/oFvAQLevIx3ZbFc0fjYgpIs4mOvCx9idObGnM+++eznvALREQLxREyCw/AXbhia+TMEezg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2RoqtRc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2RoqtRc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so42192085e9.2
        for <linux-m68k@vger.kernel.org>; Wed, 15 Oct 2025 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760536416; x=1761141216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqOmoGsO8trYgMWNWNZ7iS8eeHupXqHvme7XfA7g8fw=;
        b=d2RoqtRcNZZ7OgIbR6a/B+bnakofR0frrNNrsUBx2J8Fk+ktFT8VUo+5/GLVyCArVZ
         cf9CI3VHUTSyBKDAw9TNicpa7Mz2NTB6o5pRT/af41tc/CvnPmwAirRjox10xgYyt0rV
         aStuPuqsh9vabgPGVRi0j0snuMlinXF27o9tuBwTyNEPgKef0V5DEidH7jzkbHnUl1Rd
         qrtkm1AWD4YsHUvdx3Xf/TljeZfzTcYKHetT8k3YEFq9UBDmu8rHzO6vvsjiT0UysEYH
         YOYRsCywIhdpKPOI7/x2e2hNDJpiT1AIfT/uyshIsOA/mtN2fGDkxEphVKpXw9cKHBsT
         IJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760536416; x=1761141216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqOmoGsO8trYgMWNWNZ7iS8eeHupXqHvme7XfA7g8fw=;
        b=qgtLVhWYBwY3jA6i08fPLM+JCRGDUA4aYXspe/NqwAkGKpg+9vX+UipSt7AF08IPcA
         7Veijkh3RpeVUis2cmiFlKEAsEh+OwR8bL9m+fp8TMEkS6II7UyQU153OrlRubAEN6vT
         c16I1OkPIAsWOORj0+2vMxymHChxWstzsKSX/l7AsV+qodgDViMAxp2Ykuzru+qlAkyY
         FSJVXu34tJ5pMSPoBEQKO0aC8wTxFvDB6XWWkySwmx79Xp/+CMHiVNGDoxgJjrcSKewj
         wgft6BRMdoy/QIf4OcIA4yTkGpEj6Bc8AZAdSh7hquAO2lklD/5URv5PjUbcbEuel4ow
         XP7A==
X-Forwarded-Encrypted: i=1; AJvYcCVWu+H1p6pDJv416XRPFegquci3Ym+0it27OVTE1MZ5vsj8t5iS3h0QldpqoI1e8yynoB+Ctl7aMHTH@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdxo72R9+hIW6YibU2/+WE99N46BdjT+bRZTJ0rQ6upIo+lmi
	FagnmGJNxkOUIuu5cLIoAdN7vPAYDadRUWmCtk1ZGhGcdOEhu0XOOFIA
X-Gm-Gg: ASbGncv2f/10zLqx1EYmZDGco9jxMLaOGZkZWaisRV5tq4ItZa6UCrKs9Ta/EOQz62o
	pK6yTZ+zWsodo+lzbfa9zMTC73p9fL1iIixogf+RkU8nqx/5zafsZR/4hcWYovpds+W1kfKcbKL
	CpC1ariUG7HJ4vSsp9sIYQ9oJn4wGPuuc0T7gGwkb+Rqvk501kb/9frHzjtK0CsTXa3C3DPaphH
	ZqoEXML9SEn8mtHDgbxeffcfMB4Pyc4rqCFtXgaoW3NMVLmgRnHqFOtyCtqLInYNWvn4vi02B54
	uO8oumLSn1F+rBaIuenzEmwykr1HVB8Y8PRuh5DPDLx4mVFfic7fqb6rO7HUu1BX0SXMciacTHt
	hvzs9/FlEkRZqfCoGhQztTbeBFx5tNLzAEepg3SGTAbZJrUXN1CJUL7T0d4Fsiw+IJRYY+YarvU
	SoZAgk1ks=
X-Google-Smtp-Source: AGHT+IENrsvklw3VMayWb2/SzhwdX4veJ0+2ZwpShwijlf0i60yg9zXIjqKms1bHJUjYdDjkBYD4JQ==
X-Received: by 2002:a05:600c:6095:b0:46f:b32e:52d9 with SMTP id 5b1f17b1804b1-46fb3cbc5f8mr146733575e9.13.1760536415649;
        Wed, 15 Oct 2025 06:53:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710049cba2sm35932135e9.0.2025.10.15.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:53:35 -0700 (PDT)
Date: Wed, 15 Oct 2025 14:53:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland
 <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [RFC v3 1/5] documentation: Discourage alignment assumptions
Message-ID: <20251015145332.260eebe6@pumpkin>
In-Reply-To: <f5f939ae-f966-37ba-369d-be147c0642a3@linux-m68k.org>
References: <cover.1759875560.git.fthain@linux-m68k.org>
	<76571a0e5ed7716701650ec80b7a0cd1cf07fde6.1759875560.git.fthain@linux-m68k.org>
	<20251014112359.451d8058@pumpkin>
	<f5f939ae-f966-37ba-369d-be147c0642a3@linux-m68k.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Oct 2025 18:40:39 +1100 (AEDT)
Finn Thain <fthain@linux-m68k.org> wrote:

> On Tue, 14 Oct 2025, David Laight wrote:
> 
> > On Wed, 08 Oct 2025 09:19:20 +1100
> > Finn Thain <fthain@linux-m68k.org> wrote:
> >   
> > > Discourage assumptions that simply don't hold for all Linux ABIs.
> > > Exceptions to the natural alignment rule for scalar types include
> > > long long on i386 and sh.
> > > ---
> > >  Documentation/core-api/unaligned-memory-access.rst | 7 -------
> > >  1 file changed, 7 deletions(-)
> > > 
> > > diff --git a/Documentation/core-api/unaligned-memory-access.rst b/Documentation/core-api/unaligned-memory-access.rst
> > > index 5ceeb80eb539..1390ce2b7291 100644
> > > --- a/Documentation/core-api/unaligned-memory-access.rst
> > > +++ b/Documentation/core-api/unaligned-memory-access.rst
> > > @@ -40,9 +40,6 @@ The rule mentioned above forms what we refer to as natural alignment:
> > >  When accessing N bytes of memory, the base memory address must be evenly
> > >  divisible by N, i.e. addr % N == 0.
> > >  
> > > -When writing code, assume the target architecture has natural alignment
> > > -requirements.  
> > 
> > I think I'd be more explicit, perhaps:
> > Note that not all architectures align 64bit items on 8 byte boundaries or
> > even 32bit items on 4 byte boundaries.
> >   
> 
> That's what the next para is alluding to...
> 
> > > In reality, only a few architectures require natural alignment on all sizes
> > > of memory access. However, we must consider ALL supported architectures; 
> > > writing code that satisfies natural alignment requirements is the easiest way 
> > > to achieve full portability.  
> 
> How about this?
> 
> "In reality, only a few architectures require natural alignment for all 
> sizes of memory access. That is, not all architectures need 64-bit values 
> to be aligned on 8-byte boundaries and 32-bit values on 4-byte boundaries. 
> However, when writing code intended to achieve full portability, we must 
> consider all supported architectures."

There are several separate alignments:
- The alignment the cpu needs, for most x86 instructions this is 1 byte [1].
  Many RISC cpu require 'word' alignment (for some definition of 'word').
  A problematic case is data that crosses page boundaries.
- The alignment the compiler uses for structure members; returned by _Alignof().
  m68k only 16bit aligns 32bit values.
- The 'preferred' alignment returned by __alignof__().
  32bit x86 returns 8 for 64bit types even though the ABI only 4-byte aligns them.
- The 'natural' alignment based on the size of the item.
  I'd guess that 'complex double' (if supported) may only be 8 byte aligned.

What normally matters is the ABI alignment for structure members.
If you mark anything 'packed' the compiler will generate shifts and masks (etc)
to get working code.
Taking the address of an item in a packed structure generates a warning
for very good reason. 

[1] I've fallen foul of gcc deciding to 'vectorise' a loop and then having
it crash because the buffer address was misaligned.
Nasty because the code worked in initial testing and I expected the loop
(32bit adds of a buffer) to work fine even when misaligned.

	David

> 
> > > @@ -103,10 +100,6 @@ Therefore, for standard structure types you can always rely on the compiler
> > >  to pad structures so that accesses to fields are suitably aligned (assuming
> > >  you do not cast the field to a type of different length).
> > >  
> > > -Similarly, you can also rely on the compiler to align variables and function
> > > -parameters to a naturally aligned scheme, based on the size of the type of
> > > -the variable.
> > > -
> > >  At this point, it should be clear that accessing a single byte (u8 or char)
> > >  will never cause an unaligned access, because all memory addresses are evenly
> > >  divisible by one.  
> > 
> >   

