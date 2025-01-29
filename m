Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A219340B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186152; cv=none; b=tyZUqw2QRWhzfl5MORBRMAabEFVGrecmMUKn474dDQk+XB6rEOX57IAAr9AkB1T5rGibY0tQZ0IhEI44sMCRMSo7W+om2lN257C5+l3ukKQP/cEBT1x9BcBCUCOsLfxwn9cMLhiJAQ8bv6dh2T043VetzY6niom82nRcoG1XND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186152; c=relaxed/simple;
	bh=c8nW3ZmYDs1X/So5oD/3bpCh5qukpkvLJpoz+Jwk82Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lyKXF9WPZT9zHItoj0wPThxPD11TUQCFpto/jvqAV/9SmU2uPA01nCS58Fy1DnAN7JgcAz004lxnaY/nnRXJVE1oB3O5Wc13GWqIJNcmzKPbAE6Jh6IC6XzF3Mfnya/Br9TlZHkBUmHo1dwZWvkZEFlUAM9f+Kb574xcYuINNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz8BEpQ2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz8BEpQ2"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so526191fa.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186149; x=1738790949; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=Xz8BEpQ2+Kc5eoVbk5aOAHIH83nJnArovTh1DiH8SgovoDpRsrl4OT2YNSv2jv+nzH
         5JWNx9OgG4cOsW23CjND7i0mx2HcUJO8IjudQorn4+nIU2gOZMYHAqWuUGIl60r89pXC
         3XhNwd5qTMoROC8WdxFnYuG5xYEIH1BO+0zncd52l0MAQBUfSVrRjltpSEqTcSnN6uFQ
         AYdQlM0iG4aopoafuRt89OrO1BQMMfahz4gHLonMCeuPYQeYLn9nCy1uRVGlIUdTRqrT
         Ti2MLONmwC9LD36JgvCX4wrJ/gKkXgFL8LcMzEPaqE5B5qB9q6qB88SinPwlBaYBj4zZ
         smng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186149; x=1738790949;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=brWdbCArUn6P6D998bovpU8CMyenFn7QoTtTdbIKU4EcBPXfMGzPcGy2rbNYmueHym
         xFS1Lo3qvFZTGkVU7AN6kofNcB0rCzz5rn46v/aSSUKD9SaZfEl8Rvdzry1wr5a8By1u
         k5jSEiBuA4eziMA1SmuAGtDymxHiNZ1TeGCeXQaYuDi1sIF/Lf40ypwBc1/zssq3tulI
         cNI6Qz6sGM/U/qifLEvSyN4utItCgPijdoTA3dLfUve+Kewbmwp3gXDmMK6NY3jVfDyM
         x3p5Fx3SyDu5STz1VoO2Gv4KPfSId0AMyrkGV5uw6V5fLD2xnDRZgZryQh7qxVw5stmA
         d/jg==
X-Forwarded-Encrypted: i=1; AJvYcCUJoUN7Yu8yhQLZgownKtRYGzb7i5wwIBgfvBc+h98JPuBGnDV5NB6rlXJXXnXhndVWa8f+PT6t99tR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzdXRz7f6qZnQWY/kK+rAXl0y9p7IY4ulzSIL97vmMK48xrBGXI
	CZ+TinFnimym2AwQRNOHqpB3K5i37Zn8hMj4WfC7RFo6KCwYr6ZaL5TXuv86A+NASJwt5kmodfI
	i0KzWPHaevfrXTuMRsCxzeHK8x9E=
X-Gm-Gg: ASbGncsStiiQ77VHHJt4HGbEG6BJbT5WnbQke1pWmTlm20aW4lblncwAP633G4/WDYe
	mh4505GOSO6gVHRin+9EDFPRpzs5CQsPBECJCrh6W+UYfvUu5uikZ6RAsUz5ABay5EpcHqDTS00
	wMwp2UQCa9IGg2WmbFG4fGkK/ypAC6Xw==
X-Google-Smtp-Source: AGHT+IEini7TIAvHWFfZWJAA/DIhlgY7ELxTDYTMmVhvFmOP3+WEeVrbZSpqp7JMDeFBEGMKPTMSdGVLiQ0G7+RO3zE=
X-Received: by 2002:a2e:bc26:0:b0:302:49ba:2550 with SMTP id
 38308e7fff4ca-307968572cemr17704121fa.21.1738186149080; Wed, 29 Jan 2025
 13:29:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
In-Reply-To: <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 16:28:32 -0500
X-Gm-Features: AWEUYZm30qzC7OYicUCyM7022EFlqK5dvrSLqA0Ri2_QEk_6Vs9gveN9uXDYy-8
Message-ID: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	tamird@gmail.com, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > + Liam, Matthew
>
> + linux-mm
>
> Thank you Sid.
>
> >
> > Hello,
> >
> > I believe this patch needs to be reverted for now as it breaks the
> > user-space build of /tools/testing/radix-tree with:
> >
> > In file included from xarray.c:11:
> > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such fil=
e
> > or directory
> >      9 | #include <kunit/test.h>
> >        |          ^~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [<builtin>: xarray.o] Error 1
> > make: *** Waiting for unfinished jobs....
> >
> > this then prevents the maple tree test suite from building.
>
> How are grammar corrections going to the right person (but not the
> mailing list) while an entire conversion to kunit is not [1]?

Very simple: the tests are not properly included in MAINTAINERS. I
sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e3=
1f30f47@gmail.com/
a few minutes ago for this reason.

> Does the patch really need to drop the module testing too?
>
> What exactly is the point of converting one testing system to another
> besides disruption of actual work?  Who asked for this?  What is the
> point?

All this is described in the commit message.

> Is anyone doing work on the xarray running the kunit tests?

I was doing work on xarray and I was running the kunit tests.

> This should be reverted as it should never have been merged.
>
> Regards,
> Liam
>
> [1]. https://lore.kernel.org/all/20241009193602.41797-2-tamird@gmail.com/
