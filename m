Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E187119F487
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192142; cv=none; b=kvWZmxG1FMZ/xhh2//oyz4CW0P0/UJEMCyMBB1QdflLe55AEroXMw3BOZqgAgDYzKh8Yg9qKJpg4JrZ7+as0v/gQb1ggcbyZEbu7OdeB69952184DWeDAw+mvzsUz42If9KVM2I+VR52qDG4z9WdkGxxR1NXaAp6eL8lBN6tQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192142; c=relaxed/simple;
	bh=3aFeVwWbkAiwkd2VaAROVCziQzzUR7JbWU5jgWJLJ5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYA/YwORYrWeBu1V4icwT+/hYUvP9Mx5ujHCnd/XgLRLeCMtetRGBNaBlGzjTdahNy+Kmq5mtm35saIVIf0+OlEsAN0UvDh5ZFPOUBDljAIy92Ws6h4y7UI3WvwBLCCoI+Eydig6/tWDJrmtaBihtJmVWpfRQmExtvRyhp1ktXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQudNxL7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQudNxL7"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a59so1496571fa.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192139; x=1738796939; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=IQudNxL71KnVYT8ZmZHC3EWwtV/ON3BjLhNdAx73Qj+sRWjXNVyEb1nG2/WJIrGV7S
         H0YI0Wl3QbaJXCezUZyMPzTFhINWFybaFb+xUh/rgz2v9hZnlustWIi2oqfHzBhwekFp
         CXQQ4kDfXEa3enI5BV0Ec8O8dt3yMntroOQwbqQSFunBGeoV3R+P3J4IoTNsucNsdUFr
         78VhSO3rQbAptrqMeHNk2pGbPb9pVjWHmVqqapv9GcfgAIVILJgaROVpXiCEBAUvAu0K
         dDm3iDCbyEFTkhYWcb8b5VjZ/qIol3+EG5aZx8G0h9m4Rcwl+gWdq6BZC+sp2bQ1PWDX
         vG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192139; x=1738796939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=tNsk6FrfBRgeFS9IBZf0u2R1ShGExxeXmVaPjXZTLhk162sv0x/lSBr/wJQA8yvi84
         hyBoOxqY3nJi+spJfh9CvJ3kzz5qKMHeZEYtWqRuEwoLjN0YTN0307iOoxxvbRhqXUjg
         OPFMAy6K7BLYzAOrtGZrSdIA3F4SltqfvUNGHXEfjyQCTALC6N2Y6bzZnsg+88DxjJYF
         HhA8/wvzS5OPZHDXUTP6LjsgjIPYB+TJdyJ6aoEQtjzTwAi462J6Cn/oKa8kpC+SgyD+
         yGEMLCQpVOW8YNgf5aNjEbll35FXoGbQnReIA6Lxw2XQWfr7wkieAPu0r9CtB/fhJAch
         dd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEpJRg8yckBeO/p9OAe01NIz05LfspdQKGEcu7OdMMsLhlAmXPDxDD8UPaf/vdItAqt48XGxL2S1VK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwOTORiaL7QjT+mzmf2wIZqTQXxKW06gQjcGzBztOensnoI58Fx
	OtDfOG/pj2fQrS5as2qACSztNVO68y2q4u1M1fEvSh9vBITCIKPLYJ8RoY0bujw+cpeMWUn/FDa
	h7aWjZIsdI3FZ3dz2s+BT8c1Lm+o=
X-Gm-Gg: ASbGncvfJjiqTHPLyTPppuKSIK5keus4xu5QCFG++G5wwrIktuMplPcUi+I+O4Mlw3i
	Jz0tfQQxAIxDGV1x/cQXkXztixFSgaWbQltrkDSQ6ZA2Hd8qjc0AHP8YjztJGqz7oash1ZnDzI2
	aTi66aQDcjPewqb4a8GNyaCA4L2aJUDg==
X-Google-Smtp-Source: AGHT+IGw4hDomqOPsGmP6ryOmQMcXXWdZqLA8giCzG80P3G1E1mNKcM08esBXc35n67oCdPU79/hBsdXpNJs+7goWuY=
X-Received: by 2002:a05:651c:220e:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-3079680c757mr22614121fa.7.1738192138842; Wed, 29 Jan 2025
 15:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com> <Z5qzk_92KU0xoLcP@casper.infradead.org>
In-Reply-To: <Z5qzk_92KU0xoLcP@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:08:22 -0500
X-Gm-Features: AWEUYZnWxaXWv5__MIDVh4wuy5lxhHQnPr0jMuSdSi61tZVSWMfJQozfaebSPPI
Message-ID: <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:02=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 05:33:06PM -0500, Tamir Duberstein wrote:
> > >  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> > > Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:=
1/3=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D1=
7%)
> > > Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,com=
mit_signer:3/3=3D100%)
> >
> > I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
> > doesn't know that test_xarray.c and xarray.c have the same maintainer.
>
> You need to use your brain.  You can't just say "I used the tool".
> Tools are just tools.  Sometimes they're wrong.  My email address is
> listed as the Author: of test_xarray.c.  You should have noticed that.

The whole point of tools is to liberate stupid humans' brains like
mine from mundane tasks like working out who to email. The tool wasn't
wrong; it did exactly what you told it to do in your MAINTAINERS
entry.

> > For what it's worth the kunit invocation, while obscure, is
> > self-documenting. There's usage information that's reasonably
> > understandable embedded in the tool itself. I looked for the userspace
> > testing initially but failed to find
> > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > meant to compile this.
>
> kunit is useless.  The test_xarray.c module is useless.  If you break
> xarray, the kernel won't boot far enough to load any modules.  You
> haven't thought about this AT ALL.

I don't understand what you're saying here.

> cd tools/testing/radix-tree
> make
>
> Then you can run the tests, whichever ones make sense for you to run.

Thanks.
