Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8E25C71C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218855; cv=none; b=IehiE9JfqXV+x6tbr6u3JrI+mxOsrQXs3K4eyIyWvL9blvpfTZMAQzez8XgA6NIUDZiysCe+9yWZxg8c2p1rw4b1WHim8bSswGElHjQKDFavMvAYUkbZUL8xm3IlruVnNASACnXYoH0ynXIq95tJQXYOwBUmr+81Po7Z8AwQ89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218855; c=relaxed/simple;
	bh=ys45DKwqBT2EZf6VkkJgb2kGSEyOBWQxiOG3jBxAVPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b22A2qhlpOXbSt8HaRjQO+xB3j+cUkyeVxhyobjxQAkzimNUtrVm9kqf9awJq6SOPKJUMnW/TK+OExbGszXdy6xsvId9qwSPttkByutegdJSMjrhmxv81UJf29Z5kHdecBUz0J+evTPpxBLJNuWv22Dp2Xnulh1m4xwigU6oJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5V0Kmcm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5V0Kmcm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f5660c2fdso62130855ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 12:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739218853; x=1739823653; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+U4SNtAYoNj/slS851MmEMQHfNyRR3XcIfGGghXow/M=;
        b=B5V0Kmcm/8YCMuXfsIVWxN+SIQmMgvo15CXvZh58UrI9f5d/A7p+j7RuvVV7jP6ukm
         O0EyFuaFFKa4h6dYAdIZo/wWXcBFuNmbo6UeDp7xH+oCAXVhu+hheaT+MXz8n9rUHnSO
         wqGZwh2E7GznsjjRx9BUHzqXcpF3XmLKjcWgV5OLRDsGd2UYI9Gkq2eBHFmZDbKbUfsY
         jvc4eP3IUDEub5+07GyJjQhicRzL0cF3oRAIgJyysukFHYH1mPCC55Lr8XTmgwWCs7mD
         EA6PvJvfRONlRIp7s2+kuUHnjgf1CWIyaCbvLJdbzxnLoxWVjyYME78Rf5l2K0vxy5/2
         ePYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739218853; x=1739823653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U4SNtAYoNj/slS851MmEMQHfNyRR3XcIfGGghXow/M=;
        b=e2SmTndfHPlJaMM0Ed1mz1MoiuAm7TU/XamG3mKg8veYAiPPA9AXvuDU6YbqG2Ez2A
         W/hx/vXF55O/bcLaaeCGdZtu7hd9gWMCOQKVM7e4PJSh02lmSrsmZjZFIWpOfkd8nSna
         +rwmPcOWxJv8lB7ubCBm6XDX58QBEFSeveucEKmOVU51a+epX4DhorCY5tCi2eDg1MRU
         /la/floZA8hpuhG33hyx1HM9Bc14OQacqZ+E7c23BxFjwaCka2oOoHkzS/zqMGX2LKe5
         QkvCBX6oq2UK4gk4NydVDZW7rbXiSSPln0IVkWcdlP/zo80GUd+TrVuztF/JdL479uny
         D6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC750MWf9s6XTT2P9RII03M7UJTXJIAO2LRhWzn7hcYzmjOePljNcZa41AXPhauQVWK0cSbNTD9yfS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwM5uzXQu48uX7P4HShELFqFMZjVennMQIOx86QX1LINxZKy9tK
	q2jaAhh15LCt3EupndiQVaSGFryqvBO3MtIJ1BJ4N8EGA+iLfYlz
X-Gm-Gg: ASbGnctSx+FKiItqHBOvL882JE8KlvNoPA9cjH6FAwxIkRCg4EjmSU2CE/+wTFTSSOA
	UpkUkFbMJqM2O0uH2jqO+UwGIdTo4NQq/GtbR+aUSVMNGt7ehG17hVdpdrlBpPsL98SX+dPYt/C
	vaH63qUzkANR+qIaNFPx5ilkvRPfjuvymZGCxHSccmJJ2koM2B1KqGVHgB/78UK57BC5MRt47Du
	CW+G6lAaE7DknnQYSxQckwYlELhRnXVAgypClZCvlgbzRT163HGu0W7RbXRXUNfAfO5ha6ln+gj
	kQHkvQMnntiGBfo=
X-Google-Smtp-Source: AGHT+IFFp7T1utLBt4O/HjDrewHfjUvFxkAs6j6ggHA+b7oWllB60ZkZFVyLSjMCjdbjvvvdajt23Q==
X-Received: by 2002:a17:903:94e:b0:215:9470:7e82 with SMTP id d9443c01a7336-21f4e6a035bmr293695885ad.4.1739218852479;
        Mon, 10 Feb 2025 12:20:52 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce0bsm82768025ad.21.2025.02.10.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:20:51 -0800 (PST)
Date: Mon, 10 Feb 2025 15:20:50 -0500
From: Yury Norov <yury.norov@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Tamir Duberstein <tamird@gmail.com>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Brad Figg <bfigg@nvidia.com>, David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
Message-ID: <Z6pfomw-3LuWoQQo@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad>
 <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>

On Mon, Feb 10, 2025 at 11:35:48AM -0800, John Hubbard wrote:
> On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> > On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > > > On 7/27/24 12:35 AM, Shuah Khan wrote:
> ...
> > > > The crux of the argument seems to be that the config help text is taken
> > > > to describe the author's intent with the fragment "at boot". I think
> > 
> > IMO, "at boot" is a misnomer, as most tests can be either builtin
> > or modular.
> 
> Right.
> 
> > 
> > > KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> > > on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> 
> OK so I just bought a shiny new test machine, and installed one of the
> big name distros on it, hoping they've moved ahead and bought into the kunit
> story...
> 
> $ grep KUNIT /boot/config-6.8.0-52-generic
> # CONFIG_KUNIT is not set
> 
> ...gagghh! No such luck. One more data point, in support of Yuri's complaint. :)
> 
> > 
> > I think distros should start setting CONFIG_KUNIT=m.
> 
> Yes they should! kunit really does have important advantages for many use
> cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the main
> obstacle.

Hi John, Geert, Tamir,

Can you please explain in details which advantages KUNIT brings to
the test_bitmap.c, find_bit_benchmark.c and other low-level tests?

I'm not strongly against moving under KUNIT's hat, but I do:
 - respect commitment of my contributors, so I don't want to wipe git
   history for no serious reason;
 - respect time of my testers, so no extra dependencies;
 - respect time of reviewers.

Tamir,

If it comes to v2, can you please begin your series with an exhaustive
and clear answer to the following questions:
 - What do the tests miss now?
 - What do _you_ need from the tests? Describe your test scenario.
 - How exactly KUNIT helps you testing bitmaps and friends better?
 - Is there a way to meet your needs with a less invasive approach,
   particularly without run-time dependencies?

Thanks,
Yury
