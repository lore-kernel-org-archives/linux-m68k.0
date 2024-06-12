Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0581822C9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211117; cv=none; b=inpJFEY1ecrqgx+nI/U+x+el+JMUb1WAN1LChhsCznRhD+9TcGZ9arR8rSHHm3QDOY3szLkIj1xTjlLcnQ7D8ve33qQYh9KW5RWuCWqU+F98N4oyI4NfL6Shkdpmt3oCbwPXBDBAVuHOCLQGfSz0KJE62eA4Ua1Gn89PN4Sowgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211117; c=relaxed/simple;
	bh=i3zcEBBXxs419UXvZd1JWOYs5IMvkcbnW3VEvOOo4nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItGZ8BFgwSfaCJOcNBHjtGz7C6JmUk8j1kc7oiozeaS2M+wSrI27lKp+zeyJuVEvY9u9CUbN0p6njiM+c6/4FEt+eCJoHONRRphNxOx/R+fBwbH5gJnEgGelt+aNdvreA+mvg+uCNsdvSBLba/SUJbPqfESeEFF9AjSN7HvgrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FajjE16o; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FajjE16o"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4B9CCE21F8;
	Wed, 12 Jun 2024 16:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0F1C116B1;
	Wed, 12 Jun 2024 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718211112;
	bh=i3zcEBBXxs419UXvZd1JWOYs5IMvkcbnW3VEvOOo4nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FajjE16oiN0sCUdjEHzhtdxIoQ+JmYsyycKinb3gPp0UQgycwaTf9mimZp45Z+LUA
	 3JiCZMbf5+BwW4ZS39+uhlQV5jbXLmPiv1TuqONCArjpoJU/JQgISOe2K8G+bHT21z
	 ymkmuE0Ro8bp+PEdeeR3m5ubtux7jtn4alCYIEtbJ4IwAcFn7M+AiwPmE/rzNhxpaG
	 e9g1Y9xqf2Awq9tz5ViRJ6+cCj5jjHVyEuTU7StQn+yOG2CerxhMEcmrfrgXBkB7aL
	 cXmxFwTgwvFigVH6NQpjlAvAeFQW9WDg5tKWcw+97DmjO4JSlooWHFzL1MaaVxnI92
	 0WEHACeqIZeMA==
Date: Wed, 12 Jun 2024 09:51:52 -0700
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
Message-ID: <202406120927.3C64ACD6@keescook>
References: <20240610213055.it.075-kees@kernel.org>
 <20240610213330.1310156-2-kees@kernel.org>
 <CABVgOSmFL50_qYOBROkE9LZx__W6MLnHWahGnAVuLBDVO4k1zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSmFL50_qYOBROkE9LZx__W6MLnHWahGnAVuLBDVO4k1zQ@mail.gmail.com>

On Wed, Jun 12, 2024 at 05:13:39PM +0800, David Gow wrote:
> On Tue, 11 Jun 2024 at 05:33, Kees Cook <kees@kernel.org> wrote:
> >
> > Convert the runtime tests of hardened usercopy to standard KUnit tests.
> >
> > Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Link: https://lore.kernel.org/r/20200721174654.72132-1-vitor@massaru.org
> > Tested-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> 
> This looks good, particularly with the x86 fix applied.
> 
> It's still hanging on m68k -- I think at the 'illegal reversed
> copy_to_user passed' test -- but I'll admit to not having tried to
> debug it further.
> 
> One other (set of) notes below about using KUNIT_EXPECT_MEMEQ_MSG(),
> otherwise (assuming the m68k stuff isn't actually a regression, which
> I haven't tested but I imagine is unlikely),

Hi Geert,

I'm trying to debug a hang on m68k in the usercopy behavioral testing
routines. It's testing for the pathological case of having inverted
arguments to copy_to_user():

        user_addr = kunit_vm_mmap(test, NULL, 0, priv->size,
                            PROT_READ | PROT_WRITE | PROT_EXEC,
                            MAP_ANONYMOUS | MAP_PRIVATE, 0);
	...
	bad_usermem = (char *)user_addr;
	...
	KUNIT_EXPECT_NE_MSG(test, copy_to_user((char __user *)kmem, bad_usermem,
					       PAGE_SIZE), 0,
		"illegal reversed copy_to_user passed");

On other architectures, this immediate fails because the access_ok()
check rejects it. On m68k with CONFIG_ALTERNATE_USER_ADDRESS_SPACE,
access_ok() short-circuits to "true". I've tried reading
arch/m68k/include/asm/uaccess.h but I'm not sure what's happening under
CONFIG_CPU_HAS_ADDRESS_SPACES.

For now I've excluded that test for m68k, but I'm not sure what's
expected to happen here on m68k for this set of bad arguments. Can you
advise?

Thanks!

-Kees

-- 
Kees Cook
