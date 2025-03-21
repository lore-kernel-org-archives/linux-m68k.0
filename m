Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719722D7A4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576056; cv=none; b=SM58DdpT7GQFbf2i4IMa8qEwBhqoictsGU/i3iVvJ1E8pdEa5Kk4R2vX1QlcTyi/LFtjKqt18B9CG9IMhMNLDTnQJjR0DuGmqXXpbDSlHzniZaCnNJLX1ZRaNhEkrHly2aYFpP5wbCrnNMMZOiDkF6m5rPZo27Z0Xql3M4DYrXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576056; c=relaxed/simple;
	bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrgj8FyaS1jnSyBPGdoXMGFqk4Jvos1TJP7YvvxSp1e0tWIG2qFwWlufhunVed36qUE9b9ahJ+CU0V1QLRXQaTc79fo5aSvltx/cnJldLJGBoNjzOfs1lUO/2JxDbvQb2V2BWoFIB7g6iKWJKM736uHE3WA2UVzPnWBqW7KPk6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbwEOQW9; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbwEOQW9"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bd11bfec6so23423971fa.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576053; x=1743180853; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
        b=GbwEOQW9VSkjXhwd2FCQKKyGTXW0BghEfv/ci9BDB6Gq+RgczvqdgRNQWWV+QizxC1
         Q+3rkkqDCsLMnCCEgoZPC3FtcrMI8RoXbiqAxV+r7eutsKJoIuorhCWZX5lGIkXLiGxm
         rhAdor4RQIYk3TYm0iCQbrTZoR4MzRGRPE12n2zDernO9sW0LmJDYF59WshGe080fM9p
         9O3RT8Y0zBGURXPrDPTktWoJUYI9Wc/ZT49M51LwTI9kgPKHL+2Ku/5lsywXOwp9J1nU
         0JKkCPv05PgiMjRKorkdDU9WoQrCBCwxoZ6DsHPcZXGQbYFaznpr8q8HzvWt/dmIozDs
         PPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576053; x=1743180853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
        b=IBWvTPLSjejk1apwzSgA86pVzp9C65qWYYxfZ/7rDR8zaUMfL+ynsk+wTfij9vqQkJ
         GQhfOWjQ/j5M47M/3F3A0ZorOUL3EJRygIQMXny0AkmWpWmRD6OcuJLn0o95h+L2arXe
         MsWLmVAZDkbfTnS8KZsFitsGmlJgzd49TU0M8aCv9UanibmVWQoc3UpU15Cri5QcXoZX
         zWeHxofLTHbEdx3Pdvj9SBctFCeWnpsOGfvS36wlTKoNW7lHTRr+inWnEmxfwXyK1HT3
         R7tfjxVZbePKboA4IVlb58Z4HdUzghQn+cBh2MRM2UZlW7UV/t2JVQCIe4i6K5lc0gSn
         lUsg==
X-Forwarded-Encrypted: i=1; AJvYcCWv3A2CrCqQ400RLw8rC4KHXiCDnoLXKBKWAtIBQAJNGamdico8qh0QfbOMuxEIzS2vS+hqSSxv6kLg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwR1s6KlAt+dLD5/n9fmBJfQJzoShLfQ0VfgFOuP1G5kBY08IXL
	dkZrBOM4vgOQYR6VCoYxGkxkBKf3kZU8KNQHzAPK8UODxdiZaFByWbjSZDUZcDS/7rj3AS07/xV
	ihk9J/1ofK38wEMW4xFxSAZxOBNk=
X-Gm-Gg: ASbGnctbkEiWc1XHsm6sgTMDSn85C1c0aPvfOxwjBc8b93GPvRt7qeOn4RN/Owz/+JT
	eFA6jO4J1dxD4iTKa1SSsLLHAS/FfSv3qYIU4HF8QyqLJcUsJdBOZf8WsZ9hBTkswnRZ7MExxLB
	tO44/Eh9t1qxN0WFKZ5eapqBpBfviAmJqMROYgGtDKVQ==
X-Google-Smtp-Source: AGHT+IG4olNJH+a7c6RlZFJF8zMksT58/wvmA/7TP25sQDIbCAdnPDYZgYQ8vKGk1x10x0tRVyTKoEGU45fo+N4bqok=
X-Received: by 2002:a2e:8e73:0:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-30d7e2383b9mr16939331fa.18.1742576052901; Fri, 21 Mar 2025
 09:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad> <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
In-Reply-To: <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Mar 2025 12:53:36 -0400
X-Gm-Features: AQ5f1JocXlnKOaYntHf6DffQI-TKvt-QvytM7DCEc6s7gdq0Tj17rR69Ljw6v-g
Message-ID: <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: David Gow <davidgow@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
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

Hi all, now that the printf and scanf series have been taken via kees'
tree[0] and sent in for v6.15-rc1[1], I wonder if we'd like to revisit
this discussion.

As I understand it, the primary objections to moving bitmap to KUnit were:
- Unclear benefits.
- Source churn.
- Extra dependencies for benchmarks.

Hopefully David's enumeration of the benefits of KUnit was compelling.
Regarding source churn: it is inevitable, but I did pay attention to
this and minimized the diff where possible.

The last point is trickiest, because KUnit doesn't have first-class
benchmark support, but nor is there a blessed benchmark facility in
the kernel generally. I'd prefer not to tie this series to distros
enabling KUNIT_CONFIG by default, which will take $time.

I think the most sensible thing we can do - if we accept that KUnit
has benefits to offer - is to split test_bitmap.c into
benchmark_bitmap.c and bitmap_kunit.c.

Please let me know your thoughts.
Tamir

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=move-lib-kunit-v6.15-rc1
[1] https://lore.kernel.org/all/202503170842.FFEE75351@keescook/
