Received: from mail.duskware.de (mail.duskware.de [91.199.88.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879742A97
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.88.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120022; cv=none; b=pWLpsMAwwqGZsrLxCgOHuEciWDPlVTLUmMhYFcVYJADkbDbvVwWfFs/UmqfFmELtpTZ4C/L9y+RbCE2Mp3xlA2mAoJr9dVEwsmxAf2PZMCUihG2tESZbGm2MxF+3a3T9lqthZoGl6TjqMxUEBsxBj1Ez9ombyLizJOMBYK58hlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120022; c=relaxed/simple;
	bh=3W4iLAmO3j2ghtLXhW0GVuF+wTyhWvm73fqZ9nQ5p1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL86F6k0xTcBBEsSdv3ZUGT+ssWb/UbT78uSSwUYGTTDwPkWKx2WKTHP7xsqlaAmExowHpN1shr4c6DRUUwEK9kS5XmfSd0A0+IV5IP+EDgCGOmXRkQtmQNP4VQYrxCmZyroZ4yrZFTepX7/EHUZMVNoMoKrA7AL9aO25UifO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=duskware.de; spf=pass smtp.mailfrom=duskware.de; arc=none smtp.client-ip=91.199.88.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=duskware.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duskware.de
Received: by mail.duskware.de (Postfix, from userid 205)
	id 6F204A7E55; Thu,  5 Jun 2025 12:33:43 +0200 (CEST)
Date: Thu, 5 Jun 2025 12:33:43 +0200
From: Martin Husemann <martin@duskware.de>
To: Anders Magnusson <ragge@tethuvudet.se>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	port-m68k <port-m68k@netbsd.org>,
	debian-68k <debian-68k@lists.debian.org>,
	linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
Message-ID: <20250605103343.GC22312@mail.duskware.de>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <30ad91c1-b42f-48f7-81a0-e1efa64a6891@tethuvudet.se>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ad91c1-b42f-48f7-81a0-e1efa64a6891@tethuvudet.se>
User-Agent: Mutt/1.7.2 (2016-11-26)

On Thu, Jun 05, 2025 at 10:49:08AM +0200, Anders Magnusson wrote:
> Just curious; does not Linux use the processor-specific flagging in the
> binary that can tell whether it's 16- or 32-bit-aligned (and handle it
> thereafter)?
> 
> NetBSD changed VAX from 1k to 4k pages quite some time ago, and to be able
> to use both we added a new id for 4k pages.

Or add an ELF note to all new binaries - we do that on sparc64 to mark
the compiler memory model used and give all binaries w/o the note
(or a note that it is using "medlow") a different VA memory layout (to
keep shared libs in range of the instructions used there, but defeating
most of ASLR).

Example:

 > file ls  
ls: ELF 64-bit MSB pie executable, SPARC V9, relaxed memory ordering, version 1 (SYSV), dynamically linked, interpreter /libexec/ld.elf_so, for NetBSD 10.99.14, compiler model: medmid, not stripped

 > readelf -n ls

Displaying notes found in: .note.netbsd.ident
  Owner                Data size        Description
  NetBSD                0x00000004      IDENT 1099001400 (10.99.14)

Displaying notes found in: .note.netbsd.pax
  Owner                Data size        Description
  NetBSD                0x00000004      PaX <>

Displaying notes found in: .note.netbsd.mcmodel
  Owner                Data size        Description
  NetBSD        0x00000008      Unknown note type: (0x00000006)


The kernel finds these at exec/load time and sets a flag in the process
structure, and the (very few) places where it is important test for it.

This makes old installations compatible and old binaries using old
shared libs too, but you still can not mix shared libs (so you may have
to bump libc major if you really want to keep everything compatible).

Martin
