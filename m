Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A6264605
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739224950; cv=none; b=mJdTNSZMX0UAfd50tcCPEe3kT9oPAYFD29p/E/StXirfcEHtI8qpylfzJgPnH275jGEi3bPCmCsmHIESrOR4c/0dI6M8bRpS/fCoHEx7kX4qsbaiuUIzeLFj9t6kWn4WCcdoqgSbDNumxm7CjG/Zs2ZLA1F9o+aN5FiYcU31nXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739224950; c=relaxed/simple;
	bh=IvwKPNJpJVwbUYvgwowiE2ATlTHTfHicL75MLIgFv14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+N1h3zEQLGI42AETc3/xXEYjRgQ4dpbiWWmsx92/1iOH9Nq9VHJqMB8FmQCNw5yi6IqOGd7LX0NUCCMXmhhZkOS9qvTGOqJ5WeHGzs/gNwtQ852n5qaoayZEBX3yNo3ina7IfCYni0mNDM8cif/EcCz0D7wfZCrruAD870w0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1saaG/N; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1saaG/N"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30227c56b11so52030511fa.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 14:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739224947; x=1739829747; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKBtxPY73vUN0je5NCWLQ8BOv+4GXPrXFhu2CsOugcw=;
        b=C1saaG/NvDBvbDSoTivX690782HJdJd0+g5aaIu3xmx9UAzP2/i5v2mxS0D8aFmA3l
         76yCVULPaDTeLMJveDkFKVoU1RQb2ukjMlb9n2vM0GozWllVbcRWuAvwPOQeZUOGC1OA
         YQb8y9CJKExmZehIHukF+fo5955SNcsTOj9EZ1VuAJ6Uuy64msNukMLO77sjnemziaeM
         tnq5Ki9PNHDl5HE0Myulv0dMfJdSspmq2SCNATYT9leG4Uj9MaIwiWVI0nflnAA/mzPT
         GitaJqxA8if4STa6Ro6XBMYqtqRm63yg1KgpxtYa6MTCHhL40b0dDltdluSpkHdbdoNo
         rE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739224947; x=1739829747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKBtxPY73vUN0je5NCWLQ8BOv+4GXPrXFhu2CsOugcw=;
        b=KDYjWkqVC4e7ekqn4wq7V+1SB4rXixQ42LqNgR+YULtm2r2mcQAUAKjBPNleTH45yk
         zk5M5Jw1TpG7gRb6uE8yoLKErzMwu+3TsCaanpFf9nQ7NYECA+279rfNZEhnnsJnteZe
         p4pXYjmIBRJ64C9l+nCA1laim0K4lAoBRUhr1E87lJrhbkCspPMiuAnG7margdxLyrP0
         dg2DZyqtpjAKFollvtmvQQsOi3qe5WW4+mDs5CM64/U4ESrmTeTxBYTA9xejz2zOCL77
         /xftW7P6WV3xaoklVAuJxeTTab+2jEDGu3hyCynr0n7BywtwCbN+nFy0TGAVc4DtRrDL
         yiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbEKPJv7j8014PgEkox2669NYylE2g+c26cP0bVaI90xEPj//rS4VH4tG0LQ+BJ7khh0hVQVr0eAPr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx8RlP7JCRD2WMOMAELTLe8z/uqXibtASe9FlxBb6sdgNOC6Hgi
	N1gSc93gUSNrJx79shmikfmVKtH7kpCBUia+50Qdrjxq48jebwRWBTjNXXkTk6ffF7+RggxVVoK
	TM0BFfuCAElrSxaFOm7GmVEw1ebo=
X-Gm-Gg: ASbGncsooEfIqyKpdg5MVofBGp/frutgXet+ql1W9UHh0jju676Fe/4OC9GQFSXBaEZ
	KgOuxZMMQosG0DxIv60NtDegWEM67BHL/WT0FjuLI28IWu6gjWLPwIhwkmHoVOkNBq9Hnl6ZmJD
	vQyxVGBCUKTlJe
X-Google-Smtp-Source: AGHT+IFXntGT+FjS//GtLsBee13n1feXxAcsDFdmGK/9Zc8xT57kBWrr/KSN97XqSWCXZ4WJpptogalCw+FV21qYtDM=
X-Received: by 2002:a2e:a5c8:0:b0:307:e498:1269 with SMTP id
 38308e7fff4ca-308f83eafa5mr5428921fa.37.1739224946736; Mon, 10 Feb 2025
 14:02:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad>
In-Reply-To: <Z6pfomw-3LuWoQQo@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 17:01:50 -0500
X-Gm-Features: AWEUYZkKe8CssbPTeBnqdSPds-hBj-nYrF2armsMtC2A_9bwIn2Ly57bR0J6s5k
Message-ID: <CAJ-ks9nCsCfuayotpqgNytHAZ758w2oSU58dEDMXwQRU7vqisQ@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Gow <davidgow@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Mon, Feb 10, 2025 at 3:20=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Mon, Feb 10, 2025 at 11:35:48AM -0800, John Hubbard wrote:
> > On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> > > On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> > > > On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > > > > On 7/27/24 12:35 AM, Shuah Khan wrote:
> > ...
> > > > > The crux of the argument seems to be that the config help text is=
 taken
> > > > > to describe the author's intent with the fragment "at boot". I th=
ink
> > >
> > > IMO, "at boot" is a misnomer, as most tests can be either builtin
> > > or modular.
> >
> > Right.
> >
> > >
> > > > KUNIT is disabled in defconfig, at least on x86_64. It is also disa=
bled
> > > > on my Ubuntu 24.04 machine. If I take your patches, I'll be unable =
to
> >
> > OK so I just bought a shiny new test machine, and installed one of the
> > big name distros on it, hoping they've moved ahead and bought into the =
kunit
> > story...
> >
> > $ grep KUNIT /boot/config-6.8.0-52-generic
> > # CONFIG_KUNIT is not set
> >
> > ...gagghh! No such luck. One more data point, in support of Yuri's comp=
laint. :)
> >
> > >
> > > I think distros should start setting CONFIG_KUNIT=3Dm.
> >
> > Yes they should! kunit really does have important advantages for many u=
se
> > cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the mai=
n
> > obstacle.
>
> Hi John, Geert, Tamir,
>
> Can you please explain in details which advantages KUNIT brings to
> the test_bitmap.c, find_bit_benchmark.c and other low-level tests?

I can try, but I'm not the expert, and David Gow can probably elaborate fur=
ther.

As I understand it the main benefit of KUnit is standardization and
speed (and standardization _is_ speed). KUnit makes it very easy for
me, a person who has not previously contributed to any of the bitmap
code, to run those tests, and it requires zero configuration, it all
just works. It's basically just `tools/testing/kunit/kunit.py run
bitmap`, and I get the test results in a human-readable format. The
same benefit applies on the author side: test facilities are
standardized, so once you get to know the tools, all the tests start
to look the same: you can jump in and contribute without having to
first learn the so-called local "testing framework".

The important part is that this all applies to ~all other tests
written in KUnit. I can even run them *all* trivially:
`tools/testing/kunit/kunit.py run`.

Anecdotally I've also noticed there are bots running those KUnit tests
e.g. see https://lore.kernel.org/all/20250207-blackholedev-kunit-convert-v1=
-1-8ef0dc1ff881@gmail.com/
where a test I converted was immediately flagged by a robot as having
dubious type coercion.

None of these are must-haves, they are just (to me) a nice way to make
the kernel more approachable for new contributors.

As for pure benchmarks like
find_bit_benchmark.c and
test_bitmap.c::`test_bitmap_{read,write}_perf` specifically: I believe
the benefits are super limited or even negative: AFAIK KUnit is
designed to generally suppress output (in the userspace reporter, not
in the kernel) unless a test fails, so I wouldn't hurry to use it for
these.

> I'm not strongly against moving under KUNIT's hat, but I do:
>  - respect commitment of my contributors, so I don't want to wipe git
>    history for no serious reason;
>  - respect time of my testers, so no extra dependencies;
>  - respect time of reviewers.

These are valid concerns. Certainly the testing case is the most
compelling and folks are clearly interested in lowering those
barriers. I don't have any influence in this area, but I am grateful
to John for starting the conversation.

As I mentioned in the previous thread: I think we could keep
`test_bitmap_{read,write}_perf` in test_bitmap.c and get the best of
both worlds. WDYT?

> Tamir,
>
> If it comes to v2, can you please begin your series with an exhaustive
> and clear answer to the following questions:
>  - What do the tests miss now?
>  - What do _you_ need from the tests? Describe your test scenario.
>  - How exactly KUNIT helps you testing bitmaps and friends better?
>  - Is there a way to meet your needs with a less invasive approach,
>    particularly without run-time dependencies?

Hopefully I've answered these above. I can include some of it in a v2,
but perhaps the general pitch for KUnit is better placed in
documentation or slides from a conference?

Cheers.

Tamir
