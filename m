Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49235145B27
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225752; cv=none; b=oGe++Ar6fUTNA3eY6GHJA76FkwfPaZ2/XBLu1AJx1/CEVf7glz01NNRob2CURTpIXcm3QzX4o2sUEsgDRc9bTG/cbDUoVoccDj3/aJrIMK0+8KCx4LKK3rc8Xn9gV+r3KdkBsvxTACNVSaDcuZGVA3rTHp08MmbNd3Q+8E/chJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225752; c=relaxed/simple;
	bh=DM9D4FDbGNU5mWpG91VU/qPeDc9li7yVy2LWC1+OY8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtSGzWsinBhFOBgelk+ReEwU4SdG4DT3rtqkOT7bGTC6/3bPys8GvF4qG7guba87D81fy05/u9i+xaGJxulslwC+Wcale0fUTSMARndOTOKHw0MMF7ceYBtd7QNg0qvnaZiBEkDDGC6gxZaQtSYtCBeKPMdlX36iko6vai8mXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46e28597955so5549611cf.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 00:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225750; x=1738830550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaD/E6PXTaDQ2QuYo/3qqTDpp2nzD7hhPFRo29uLk0A=;
        b=TyjQXUgc15nqXlFsAnO6LC5wrsm5zOe5nipDlKw5wsNrOiTxdYuyuqmXgy+s3S1GRu
         5gCpvY3G+OA8+9DUeD4KLGJgtM/STcK1X11jvUOkri6OBbwPL0LebT0Oob7cjEI7DEIC
         ny1/sIQ4r9CC+zDSyLt/gE+EvF+do9vwo4u2FpAG8QuQGrgz0u+jOsFsjF6MQceeMWiL
         8qiRNwgJg8wbUypuJKqGhFBcgpBXNV9FptYwRGEsM4F+EA81ozwF3LewsgD0Xjs6pWHv
         v/m3X3OCL2ZB/yBlJhc08o7//PD5WNP3+zUx+adI7UTJsEyF5e5FTEhk6ko2u7uPJTid
         5BEA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvTC2JHrnnNKOelWS48cHCgC0a1f35awnkj1mU9akjuNj0zLSSLEl3uVTIVAWgV6xOr3UXYG8DfLT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz8JL4/VAv90vwDtpOUOiCVIGAmzMCqidvfXaAahZQcf/xSDwxk
	ZS1vG8W+DnBr0hs628F85kGYioMrO6+CaIEZOp36ycBmbzQtm2s5He+JML9d
X-Gm-Gg: ASbGncvCVBW50ZaYTEOPiAQSxFZVq6ZTDN5lYhhiedX/8XZk3/I4OZAIO0e1UMewjTN
	zS1YLzVwJgF9x5pcadLrMucSm5I+TfxNp+g4phHZ7SjFqfjBAwU9MmWvJaf97eVzTSl6gnkFIx5
	k+Gxt/F8E4MxNbsuFO+tywImdMqImkuTH2d8204oWCbMc7UxK7n3fnUrz4GtLwuKEbRuPp1jzfi
	tcv6HCjSTvxrb17JuVJKL7KoYBQxiY2+65wTVz9D3E7mGs5coYzqyhu7DZzKbRVc3RfArH8isPW
	5potOzGasPfPgEgWCGzZi+GRmks3mFClo1nmSaDo9Wsg0h8ta/Bokl+K/Q==
X-Google-Smtp-Source: AGHT+IHyNilIUYNC3Xd7rL0TJZBp49GvIOhY4t6VyGaPuqoizWWRKvLuEQ7vphsMzvBS37voFov7Sw==
X-Received: by 2002:a05:620a:408e:b0:7b1:4cc0:5e1f with SMTP id af79cd13be357-7bffcccae87mr892322285a.7.1738225749648;
        Thu, 30 Jan 2025 00:29:09 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bc769sm50948985a.23.2025.01.30.00.29.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:29:09 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678664e22fso5582221cf.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 00:29:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+ebHKu6axStmBq98XaOxssqVdZalaEcMZ5wS71nVyLPJJqY6zKTiLzcNG5xF6uYaOQ7I1pU7q+bP+@lists.linux-m68k.org
X-Received: by 2002:a05:6102:a52:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b9a5266e7amr5391829137.25.1738225284361; Thu, 30 Jan 2025
 00:21:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:21:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
X-Gm-Features: AWEUYZniYx50uUBB4BKLzCpQ-mS0oONl2y__yoxAs6c6zYEzharbM-CAzfEZmbQ
Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.

The long and obscure command line is a red herring: a simple
"modprobe test_xarray" is all it takes...

> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.

BTW, how do I even build tools/testing/radix-tree?
"make tools/help" doesn't show the radix-tree test.
"make tools/all" doesn't seem to try to build it.
Same for "make kselftest-all".
When trying the above, and ignoring failures due to missing packages
on my host:
  - there are several weird build errors,
  - this doesn't play well with O=,
  - lots of scary warnings when building for 32-bit,
  - ...

At least the kunit tests build (and run[1] ;-) most of the time...

[1] test_xarray started failing on m68k recently
    https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
