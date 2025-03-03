Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F942376E6
	for <linux-m68k@vger.kernel.org>; Mon,  3 Mar 2025 22:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.82.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041693; cv=none; b=pmXiAgQYypCfFOf4xRVeJ1B/q1iKoyNiiL/infDu9pIxqHMihlaw/swRMio9S8rhr1v3uPj024GpsA5MtFD5PJmFmIuCj5a9iJspFBZ+r4m31jYklO1jtK1E8sXiWdPTQkF5x91SKD5I9MXGcWdb0NChn5IUzYj0EXTNelYPWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041693; c=relaxed/simple;
	bh=CJE+AnDID6zkuG4mig8DNpZc92T5xaDQX/qt8NyOewE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUTbPbMOFobh09hmEBd7/MAtdL/8mTiQ4rvNAmeXuwM9M0i5I3HXNkAwdS801BcPFGhZKEv4On7qMDndGwe3692rMXyBDbkTehj6pILg/yTOGbeHtLPNZyg/vhzB61pUWihyj2OBiD5facNaUDkc5GRYaUoEPxOPPzCHDv80zAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com; spf=none smtp.mailfrom=allandria.com; arc=none smtp.client-ip=50.242.82.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=allandria.com
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1tpDzI-000284-9V; Mon, 03 Mar 2025 14:10:12 -0800
Date: Mon, 3 Mar 2025 14:10:12 -0800
From: Brad Boyer <flar@allandria.com>
To: Thorsten Otto <admin@tho-otto.de>
Cc: linux-m68k@vger.kernel.org
Subject: Re: Software FPU emulation in linux kernel
Message-ID: <20250303221012.GA7422@allandria.com>
References: <3374772.VqM8IeB0Os@earendil>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3374772.VqM8IeB0Os@earendil>
User-Agent: Mutt/1.5.23 (2014-03-12)

On Mon, Mar 03, 2025 at 05:22:09PM +0100, Thorsten Otto wrote:
> i'm currently trying to port the software FPU emulation of linux-m68k to 
> FreeMiNT, and got some questions about it.
> 
> the FPSP for 040/060 are not installed when the software emulation is used. 
> However, almost all trigonometric functions are not implemented: https://
> github.com/torvalds/linux/blob/7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/
> m68k/math-emu/fp_trig.c#L21-L28

The FPSP code relies on having the basic FPU of the 040 or 060 and uses
the actual floating point registers and the FPU instructions which are
implemented in hardware. On the variants without the built-in FPU, it's
expected that the FPU emulator handles all of it since that's faster
than triggering the emulator for each FPU instruction used in FPSP.

> What sense does it then make to use an emulation, when only basic
> instructions like fadd/fmul etc. are implemented? Programs are not even
> aborted when using one of those functions, uprint just prints an error
> message, and the functions just return with their input arguments as
> result instead of calculating the expected value.

Well, most programs that use FPU instructions aren't going to use anything
beyond the basics. The 68881/68882 are kind of unusual in implementing
all of that in hardware. That's why Motorola cut down the instruction
set implemented in hardware when they created the 68040. The extra chip
space wasn't worth the limited usage. The fact that the emulator ignores
the instructions is not correct, obviously.

> So essentially: is that emulation actually used anywhere?

In practice, no. There's a lot of other issues as well. I seem to
recall that it only supports the 020/030 and not the versions of
the 040/060 without FPU. It also doesn't fully implement all the
stuff like rounding modes. It's just a basic outline of how to
emulate an FPU rather than something actually useful. The advice
has always been to use a full 68040/68060 or add a real 68881/68882
chip to the 020/030 systems. Most of them do have a socket for it
or a way to add one. I think there's only a couple 030 Mac models
that don't have that option available. For example, I made sure to
get the expansion card for my IIsi that adds the FPU socket. I'm
not sure what the status is for the other platforms, but I got the
impression that the Amiga systems pretty much all run in practice
with CPU upgrades beyond the factory-original configuration.

Most existing 68LC040 chips also have the bug that causes missed
page faults after software-emulated instructions as well, making
it even less useful to support FPU emulation for them. I think
the PB190 is the only Mac with a 68LC040 new enough to be using
the fixed mask revision. Most desktop systems back then used
sockets for the main CPU making it possible to swap a 68LC040 for
the full 68040.

	Brad Boyer
	flar@allandria.com

