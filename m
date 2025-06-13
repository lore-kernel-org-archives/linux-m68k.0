Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC601E871
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831989; cv=none; b=DOweLROYeM1H0W83EZTXfdh7KvM05QK8ZpLdxHW5DWwKEJGzmEVTWYMoQRLCsznF06/FwsunKRWs9dBhoI5fz56aqXSgdj5wgIDtGExDEBQYVZKdOmFZMhhpjV1scrPWN4mnq69DJMRd6RDWcwmVthM9gVTVNg+v+CjHpXieR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831989; c=relaxed/simple;
	bh=F/iJdhUqhMEmE3qZk/JIH2JdsrTxPkptGMmzsHNNIe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGb5PIudg1pj4/xlhu4sqN3QetmMCzp1Ss6AKPKLK171eaNrMkd/IO7OlYV05Y5bptVbkR9TX77Mf0X1ZmjQEYwDLBv5HofdnL/LweUMVtcdqUnfofbgF1FO9JuOKY4/dHJ+vJmimkUyTIFVrJ9bLQ86bc2MjUgQTd3fudfWIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=netbsd.org; spf=pass smtp.mailfrom=absd.org; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=netbsd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=absd.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso1860902276.2
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 09:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831986; x=1750436786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oEQntBSBIVjuaR7p40AeUEMWu3duLVcIqluooG/51w=;
        b=IRusnrsx2SjEY/F8Fyf9QXdgAnVjHMkb32g/n+SbNLlZGvGy6vyJecpLeq2fxv4zY+
         5FzCZ7G1MmIe+A/X8doWaEkPHgYOC6r+Ct6UsH6m0iopgxz6/eTdG1dsaX1UdN4897sq
         U9CH1zuVKBhT2/NFC5Z3jUsn+JIzG5kVUJm18q4/ZUj3B+TvQ4bgugPtbgTuobSfyX+J
         C9brwTT8OUuakmkLwqXTfKonsydt7tOnticZQ8noPj8Zut6cKmzVCyR0Wqmt4N2q2bfM
         GtuRIpamUaD/XvQRkDI1vvDl07L7BWcvEA3Jkl69f4KRgJ8jTjGgZK+AZ7fBl5L/BsvQ
         cUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMs1mi2hkEoac0rG2ArBzgaBEh6AXkD8ZO/UNmKyfYRbGYktKg/eCZpgfm7N4G72VW1HDTNv2ZbcUN@vger.kernel.org
X-Gm-Message-State: AOJu0YxSWOXLPI26ZV96KrZ41fS8LJnU7MNiljqmEkDlvBS4fArgkY0V
	uFj3Ld1/k44oomb+Q/pL05rmOQoVDvPhDU21ac4b5EF6sZ+U5zCI9Cf07O031YZQUV0arBAItmR
	l6h8XFyeimKYqQSHtbcL2ZwMPonK92MQgAaip+Mo0Xw==
X-Gm-Gg: ASbGncsgWTLaVl5vNxS4gh1953huvTBEqnXcNGPskrv/Q3XJJN+hlCJKvWmZcQEc9F7
	ILgcHpysPrTkROdw6e+1hFpGBPoMWOG1Qhv+JAqKRDRfZ3w0JoX9PB9qPq8+OR4Qdu4zxM3f/MP
	lxsRDEeTCa0dL0OdSZM8ksLt2Otjq330czOxplHX/rbx8=
X-Google-Smtp-Source: AGHT+IGGJNpGJdXPjmxu/hqg2qEuI7ZEQqRoWrbcwm4KOFjm45XfynhEFunF1e5g9V6XOYhBGRIcfJMzCT/PCOmuX+Y=
X-Received: by 2002:a05:6902:e0d:b0:e81:f2c1:628c with SMTP id
 3f1490d57ef6-e822acc6b7dmr469908276.14.1749831985854; Fri, 13 Jun 2025
 09:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
In-Reply-To: <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
From: David Brownlee <abs@netbsd.org>
Date: Fri, 13 Jun 2025 17:26:13 +0100
X-Gm-Features: AX0GCFsIl_VeONm1L9tPSUKWuVHQune3VN3BmblI0m_KdvsF3i8IkWaH1bfasXo
Message-ID: <CAGN_6pZn64Ji44PdgqVm1=JPFFoQTRUjqWy6+bOCf=yQNvz28w@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 12:55, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adrian,
>
> On Sat, 7 Jun 2025 at 11:44, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Fri, 2025-06-06 at 20:20 +1000, Finn Thain wrote:
> > > Whereas, the ability to use old binaries is proof that we care about rule
> > > #1 don't break userspace.
> >
> > Who is "we"? The official(!) ABI says that pointers are supposed to be aligned
> > with 4 bytes, not 2 bytes. It's the current implementation that violates the
> > ABI, not what I want to achieve which is make Linux/m68k adhere to the official
> > specification.
>
> "The official(!) ABI"...
>
> Official according to what and to who?
> There are de jure and de facto standards.
>
> There's a lot of discussion and talking next to each other about
> "the ABI", and which ABI applies to what...
>
> The SVR4 ABI applies to systems claiming compatibility with SVR4, which
> was (AFAIK) never a goal for Linux. Before that, there were other ABIs
> used by various UNIX systems (BSD, SYSV, ...) and non-Unix systems
> (AmigaOS, Atari TOS, MacOS, ...).
>
> From its inception, Linux/m68k used an ABI compatible with SunOS,
> which dates back to the MC68000, and was probably the most popular
> UNIX OS running on m68k at that time.  Several other UNIX vendors
> followed a similar path, starting from the MC68000.  E.g. the HP-UX
> Portability Guide[1] states that HP-UX on HP9000/300 (based on SVR2
> at that time, apparently) uses an alignment of 2 bytes, too.
>
> SVR4 was an attempt to consolidate the various flavors of UNIX at
> that time (with BSD and SYSV being the two largest flavours), and
> "rebooted" the ABI.  Binary-compatibility with older versions was
> ignored, as the UNIX landscape was wildly differing anyway, and
> people cared mostly about source-compatibility.
>
> Linux has a strong history of not breaking the ABI between kernel and
> user space, so changing that ABI is a no-go.  What you do in the layers
> above (in the kernel), or above (in userspace) is something different...

I think it is generally accepted that this would be a new ABI - a
little similar to MIPS o32 vs n32, but with the twist that all CPUs
support the new ABI and the goal would be for the old ABI to be
entirely replaced.

If that is the case, the real issue would be how to manage the
coexistence with the existing 2 byte alignment ABI port.

One option would be to give it a new port name. Sensible if this was a
more mainstream port, but given the limited Debian engineering
resources (waves at glaubitz@), and desire to replace the existing ABI
entirely, I think the effort (and breakage in packages not knowing
about the new cpu name) is probably not warranted.

Given that, I think there are a number of options (of increasing effort):

1) Just to build the new ABI port with the same name, and accept that
attempts to run binaries between the two systems will fail without any
specific indication

2) Add an ELF note on new ABI binaries (similar to NetBSD/sparc64),
and have the new system fail to run old binaries with a helpful
message

3) Also add a compat layer to the new system to be able to call into a
separate set of abi libs and to versioned system calls (rewriting the
alignment data as needed), similar to NetBSD with it's a.out (2 byte
alignment) to ELF transition (4 byte alignment). That kernel ABI
versioning is likely to be a.... non trivial amount of effort, but
would allow old binaries to run transparently

These stack, so 2) only makes sense if 1) is working, and 3) if 2) is working.

My understanding is glaubitz@ is working on 1). Assuming that goes
well and unlocks a bunch of additional packages for m68k as expected,
then I think it is worth discussing whether 2) or 3) are needed and
who would work on them.

I personally think 2) is definitely worth considering, but as I'm not
volunteering to do the work, my opinion can be taken with a pinch of
salt :-p

An elephant in the room is "what if the performance hit of 4 byte
alignment is significant".

In that case some people may want to continue the 2 byte alignment
port (though I think it's safe to say at this point that unless it
reduces the performance to NS32008 leves, glaubitz@ plans to complete
and maintain the 4 byte alignment port).

In that case adding 2) plus the code to detect and reject new ABI
binaries on old systems becomes if anything more interesting, and....
I'm sure we can look forward to more animated discussions on these
lists...

David
