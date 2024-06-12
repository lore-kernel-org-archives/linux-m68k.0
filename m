Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BA84DFF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718221665; cv=none; b=o0I9TSEKOvZIHbRkBFSDYCSN1Zw3mqWJAQqXjh4bFxZU7T2gHVlIDIlnlcltra+buH9gGCvrpqTT7I2zM9szZEufVzU4RKX4OpxP7xqI4S52ifoFFmDPTGeyO+lE88Pb4M4Ff73qwdIyhLGqNI6njnOIVOszMvLMoOXHtO1dks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718221665; c=relaxed/simple;
	bh=8FQ9c7Ch3FC/45m1f2sv/N9cm5NEyghZRzqrKFkzdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9Kdcd3XFj3+mZSIAlMsiOlQzKexa60wXcM/8urwPl6LVPOJqN+xymHpdGiIVLT4TSZis7RAgTR0pqs0mbGzsIpYlhD1vJxgHTWDUEgHa2SDPmmzUx92RnTvJczFUqEeESTgGzQVzeonAgnj6nvKQMuG8UNUrJZZCei01mNd270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3n2VsgT; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3n2VsgT"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3AAA4CE2283;
	Wed, 12 Jun 2024 19:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0E3C32786;
	Wed, 12 Jun 2024 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718221660;
	bh=8FQ9c7Ch3FC/45m1f2sv/N9cm5NEyghZRzqrKFkzdcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3n2VsgTo08P0X+ucMW5nAE/Jvi9bmuYntTSGWbfOVXyyUq+OavQcZ4zmCAVQnZpv
	 +i6acaHOQFmJDaIa632xABI/nodaQrNGRsnz75tgXcuWQJJAfJ2tIpZV/bu/xhlA8p
	 CG4jNiNFNskT1asWdp4RKIYVhwfkIcjGQxFxA1U8bG7+cwLhd/2cSAXDl8w/VGK9Cw
	 YTRdjK5Vzg5lAtN4p1q4kPEobXuvszyijmAYOr7nMJFj+qijmGCB+sAFS9hN59DeN9
	 g55JEtguQDdCLfgG9tqwF1AxhD2eeNBL/41lPRER0tTmJIdgbRfqyvtgy38zWi0knR
	 5xAiZJGcQ69aA==
Date: Wed, 12 Jun 2024 12:47:39 -0700
From: Kees Cook <kees@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Gow <davidgow@google.com>,
	Vitor Massaru Iha <vitor@massaru.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <rmoar@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 2/2] usercopy: Convert test_user_copy to KUnit test
Message-ID: <202406121245.D3536D45D@keescook>
References: <20240610213055.it.075-kees@kernel.org>
 <20240610213330.1310156-2-kees@kernel.org>
 <CABVgOSmFL50_qYOBROkE9LZx__W6MLnHWahGnAVuLBDVO4k1zQ@mail.gmail.com>
 <202406120927.3C64ACD6@keescook>
 <CAMuHMdUsjy86z3=s6ipFSQrbsycPaExNv8oxrcL_8FhzabMoTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUsjy86z3=s6ipFSQrbsycPaExNv8oxrcL_8FhzabMoTg@mail.gmail.com>

On Wed, Jun 12, 2024 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Wed, Jun 12, 2024 at 6:51 PM Kees Cook <kees@kernel.org> wrote:
> > On Wed, Jun 12, 2024 at 05:13:39PM +0800, David Gow wrote:
> > > On Tue, 11 Jun 2024 at 05:33, Kees Cook <kees@kernel.org> wrote:
> > > > Convert the runtime tests of hardened usercopy to standard KUnit tests.
> > > >
> > > > Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> > > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > > Link: https://lore.kernel.org/r/20200721174654.72132-1-vitor@massaru.org
> > > > Tested-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> > > > Signed-off-by: Kees Cook <kees@kernel.org>
> > > > ---
> > >
> > > This looks good, particularly with the x86 fix applied.
> > >
> > > It's still hanging on m68k -- I think at the 'illegal reversed
> > > copy_to_user passed' test -- but I'll admit to not having tried to
> > > debug it further.
> > >
> > > One other (set of) notes below about using KUNIT_EXPECT_MEMEQ_MSG(),
> > > otherwise (assuming the m68k stuff isn't actually a regression, which
> > > I haven't tested but I imagine is unlikely),
> >
> > I'm trying to debug a hang on m68k in the usercopy behavioral testing
> > routines. It's testing for the pathological case of having inverted
> > arguments to copy_to_user():
> >
> >         user_addr = kunit_vm_mmap(test, NULL, 0, priv->size,
> >                             PROT_READ | PROT_WRITE | PROT_EXEC,
> >                             MAP_ANONYMOUS | MAP_PRIVATE, 0);
> >         ...
> >         bad_usermem = (char *)user_addr;
> >         ...
> >         KUNIT_EXPECT_NE_MSG(test, copy_to_user((char __user *)kmem, bad_usermem,
> >                                                PAGE_SIZE), 0,
> >                 "illegal reversed copy_to_user passed");
> >
> > On other architectures, this immediate fails because the access_ok()
> > check rejects it. On m68k with CONFIG_ALTERNATE_USER_ADDRESS_SPACE,
> > access_ok() short-circuits to "true". I've tried reading
> > arch/m68k/include/asm/uaccess.h but I'm not sure what's happening under
> > CONFIG_CPU_HAS_ADDRESS_SPACES.
> 
> On m68k CPUs that support CPU_HAS_ADDRESS_SPACES (i.e. all traditional
> 680x0 that can run real Linux), the CPU has separate address spaces
> for kernel and user addresses.  Accessing userspace addresses is done
> using the special "moves" instruction, so we can just use the MMU to
> catch invalid accesses.

Okay, that's what I suspected. I think I'll need to just not test this
particular case for archs with separate address spaces, since it would
be meaningless.

> 
> > For now I've excluded that test for m68k, but I'm not sure what's
> > expected to happen here on m68k for this set of bad arguments. Can you
> > advise?
> 
> Perhaps the kernel address is actually a valid user address, or
> vice versa?

Right -- I think that's what's happened.

> 
> Does the test work on systems that use 4G/4G for kernel/userspace
> instead of the usual 1G/3G split?
> 
> /me runs the old test_user_copy.ko on ARAnyM
> Seems to take a while? Or it hangs, too?

Sounds like the same behavior.

> Related reading material
> https://lore.kernel.org/all/CAMuHMdUzHwm5_TL7TNAOF+uqheJnKgsqF+_vzqGRzB_3eufKug@mail.gmail.com/
> https://lore.kernel.org/all/CAMuHMdVQ93ihgcxUbjptTaHdPjxXLyVAsAr-m3tWBJV0krS2vw@mail.gmail.com/

Thanks!

-Kees

-- 
Kees Cook
