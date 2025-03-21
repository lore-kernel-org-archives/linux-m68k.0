Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66B41C64
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 19:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586497; cv=none; b=t9TcXXdOBUoMX8bmOKLw5tMaFtEMlgy8UgLDx0RbWOzaDiwlg20WJ3bqzhmWuO6ac0mLlHmtSLlzqsGwYYqI/yO8ycs7r1rEVAWaMsaAIGxkVy5xCBP4bb51VeAnqqLt8ZZzbrM7NuLPl9ZQ2F0JgQDpg7hpukb43w8EnXYPwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586497; c=relaxed/simple;
	bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwQ2BtplOvsCTm3akg8EghZgjy96IiPIybo1cFQec+Ns6ck1jfn4N+clD/1q+ztxTWvX7wuMyk0bZo1sbOCwSHij8xseCF0uLH7XCUfEG4kkOr8OxmqQIVKAZZEK1z5q8J1D7ZZrXSFdHKiafxM8nliIfV0DgEh/SoghBj65SA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRKxbLgl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRKxbLgl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so2628945e87.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742586492; x=1743191292; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
        b=kRKxbLglY2La0XOrp4wKS/RJgbBGRRbEwHbscArxyniSAII3o9D89nYGexN3SFv8SJ
         Zlm3KMsB/1rVdE0yL3btAncEspJHlLlEXWw9CrEnAUX74XfJ/CzNczL0JZetoos33vFt
         4f/E31KiCmzdCbfPE/pPMAPtbyoyNB9KHMtxfxmdWqQdjhdih+N0Zq9LVQ/jbvXfIGo5
         0pVxHox/qj/AUVoXISlDPQ8b4kDcs1LAdV+TMLuDsnYx+1Npsj8cmt291SVyj7n/uDWj
         XN73Pgf/yU5UCWl5xLSlHOE1rNk1HFv6A+b/eDi+U/BZ7a/pv5aXEm1ZyTV+51C8KV1R
         cQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586492; x=1743191292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
        b=KhvAAZYioYzAy3qM9q4d3gsCrCYCwPjZZKGvfU3ZPNof9/HiUsjJWXI4afoYvcq2gB
         7SExDpmWfFtKTl47EPzwh0j5m0N/6tKfmwP8K9UZf+9ZmtkQFB2Mpn1eXvS8SN34pZxs
         Ilr2mWWas8az/Q1GXfuLdcWPFPzBHX4MFVanMjpK5BO8mFBAJ5cAackvXsLGq6gO4yAO
         MGQxrZzBcVvxsK7cxS8qlX7yVokXtI5SZEPnjOXDtskIqQwLCQVoq0JgcoM9ZZZKU4zN
         IOSCteNO+KJHsj0LfTJgnQIYRfKFoV5G9x0lHXcgQsztMc7h0V/e1B3dNCY2c1cW9XIF
         3h6w==
X-Forwarded-Encrypted: i=1; AJvYcCVAKwRgEV0Y8bSdf7ehrehdS6/AHGy3zpn6HkUa3OdtUXvhZUVll+w1gOoOUt12axCYLbWA9OvGdkyE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwzK2giCzv/9P1hO4xs/g3vEHjLcsnrqHrQJ+bMo+vVYBD5bVBO
	DrXkrr+x1Bu1cVqRFjE8R3vM81BY8pKFpE5qIKv0xlh+iW2P616duW2knxS89CeVDX4qoFs3JnQ
	gDc8HIIZnWn2izNeA0VZZK3sdl78=
X-Gm-Gg: ASbGncsRIBPcM7tr9ZWRhNB7y76OtMIgLPlQ74zpm8s1r1LTpXQzR/HtTkNNSRORalh
	RVYPbYPIv03rVCWFw5Oii+7/xR3rvaU7wCedQMKls23FnP3dKNy/8t7sjMVlaNNojRl9ribqivS
	5JZTeh9VBZSv3K1GhRsAGKrHWDpG2SjoTTp4kgNCzQ+w==
X-Google-Smtp-Source: AGHT+IFBFgrCJ/bchlWOwIv9rI77Cq+9FheTeIgSI10PI3pRLX14sLGNW1KkGbOtKsmpfb5BqidS5A6BsnbPgS9nwoo=
X-Received: by 2002:a05:6512:ea2:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-54ad6500d8fmr1778451e87.46.1742586492037; Fri, 21 Mar 2025
 12:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad>
 <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
 <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com> <Z92w13L8v1MvPC8_@thinkpad>
In-Reply-To: <Z92w13L8v1MvPC8_@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Mar 2025 15:47:36 -0400
X-Gm-Features: AQ5f1Jqo7tJbB2wPNw7jN7SKqpquKkjt9eOhuuAS5_i6zceZK37QYCYbQ3pr-GM
Message-ID: <CAJ-ks9ktTpUaBPk9rEp8UX9P5dZPeDuuGWfuSiR+dL3jXVb1+g@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 2:32=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Mar 21, 2025 at 12:53:36PM -0400, Tamir Duberstein wrote:
> > Hi all, now that the printf and scanf series have been taken via kees'
> > tree[0] and sent in for v6.15-rc1[1], I wonder if we'd like to revisit
> > this discussion.
> >
> > As I understand it, the primary objections to moving bitmap to KUnit we=
re:
> > - Unclear benefits.
> > - Source churn.
> > - Extra dependencies for benchmarks.
> >
> > Hopefully David's enumeration of the benefits of KUnit was compelling.
> > Regarding source churn: it is inevitable, but I did pay attention to
> > this and minimized the diff where possible.
> >
> > The last point is trickiest, because KUnit doesn't have first-class
> > benchmark support, but nor is there a blessed benchmark facility in
> > the kernel generally. I'd prefer not to tie this series to distros
> > enabling KUNIT_CONFIG by default, which will take $time.
> >
> > I think the most sensible thing we can do - if we accept that KUnit
> > has benefits to offer - is to split test_bitmap.c into
> > benchmark_bitmap.c and bitmap_kunit.c.
> >
> > Please let me know your thoughts.
>
> Sure, no problem.
>
> I asked you to answer to 4 very simple and specific questions. You
> didn't answer any of them. David sent a lengthy email that doesn't
> address them, either.

OK, that's fair I suppose. Let me try and address them now:

> - What do the tests miss now?

The tests do not _miss_ anything. They are just inconvenient to run,
particularly from automation, because they do not report success in a
way that is trivially understood by automation. In other words, I'm
not aware of something trivial I can run that will exit 0 if and only
if the bitmap tests pass.

> - What do _you_ need from the tests? Describe your test scenario.

I want kernel tests to be easier to run, and for more of them to be
run by existing automation such as LKP[0]. I know for sure that KUnit
tests are automatically run by LKP because other tests I converted to
KUnit subsequently had warnings reported by LKP.

> - How exactly KUNIT helps you testing bitmaps and friends better?

KUnit reports test results in a standard protocol (KTAP) that is
machine-friendly. It comes with userspace tools that understand this
protocol and produce useful exit codes, as well as human-friendly
output.

> - Is there a way to meet your needs with a less invasive approach,
> particularly without run-time dependencies?

I'm not aware of such a way, but if you know of one, I would be very
interested to learn.

> None of you guys submitted anything to bitmaps - neither in library,
> nor in tests. Your opinion about what is good for bitmap development
> and what's not is purely theoretical.
>
> Real contributors never concerned about current testing model.
>
> I think that you don't care about bitmaps. If bitmaps testing will get
> broken one day, or more complicated, you will not come to help. If I'm
> wrong and you are willing to contribute, you're warmly welcome! I always
> encourage people to increase testing coverage.
>
> If you'd like to add new cases to existing tests - I'll be happy. If
> you'd like to add completely new tests based on KUNITs or whatever
> else - I'll be happy just as well.

I can't speak for David, but you are right about me; I do not have an
interest in bitmap in particular. My interest is in kernel testing
generally, which I hope I have adequately explained above. As for my
willingness to help people obtain and keep good workflows, well,
you're welcome to examine my history in OSS. I've contributed to
dozens of projects, many for far longer than my professional goals
required.

Let's keep talking.
Tamir

[0] https://github.com/intel/lkp-tests
