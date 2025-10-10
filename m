Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C323A58B
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Oct 2025 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760064527; cv=none; b=UYJuShs3/pMoCqb3+FtsqOiwQ0d15SBePhPOEMNCokHANpeWlmbEEOXTIct2Cni7J8nYL05X67oaGr+xytmipIZD+3P6Y18Dpts5cH/wlt+AmwHLIbPYXf2kn3zprGbGM2mWb1qDfNx9cBxhqqHFExlwR1ThQ3uXrg3nBJZeMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760064527; c=relaxed/simple;
	bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1NdutBP80nBv+hXo/214Q8J4H2MAn8R7/4NECrTsHfMnixHaYtzn7TBfcRPatf1oH1nMVevoWJReuS7plBWgkYVm/0Pv/VcdS5VkMToXafCrxP243/luBayTfox51C94Bn1dQ8lciI7TlRLqDNbLwhi82mQTVyFZXSia/jMuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6UdcMff; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6UdcMff"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-74435335177so41239507b3.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=A6UdcMffSrdc8GHj8h4DXaeu5trH6jqkNMRwUEEx7ZKqV9aVSedlgVB1V00kapQiFg
         W3OmWhrfDcEdSjmEgeeFtMDCotogMIGYYTLeadGlca5gPmVjVHgGtfrl8yVVBDPxArBX
         jVvtI0h6P1gbS3fDMRePHYmlWcJOcbkIFV3eL0FdD0f0eQFRAUMEldbo8jEbjVYaO6iS
         vZV4eX97APOkBnJ3V5x/Fb6LkdeqdoHHxIYMDRM0F3LBGceG4162zcUeQSn/Bc4uZy3N
         Pn9ddrI1wMYkFxGOhSozX4Up8jZNTkSBFaQHxAJuKi8g2lA/UAiETZ34gQQ4JeQPJYdS
         +wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=KIm0U+m9RIQjQTDBnPzI5+vL16Y9lSo6GWQC0m3AXYsOb9oDEARunIje79ndKUmOV9
         Byt5VARce0w7SsV9Iu92R3FKblwvKhtSsDjXtgv9Ruu7nE+t4wJ/2s5DihZOT7Dfap4i
         UJtHn5faQnlNS3tIPhnU/DnAgFJeujohU72KXnnvjKgl1/zf7ZLNVm5KfL+8DZwHzSv/
         0KnklSAhDr4klolYiZQjvXqPNISdXk5Rl12gbom8+vtOK6vOzkmZCfyHrdbMQXdu/qzb
         AaMwDwRQ2T9SJRgwrSU+pjhDiyXm2QqJia/InQL4D7ugoShYgtk+Ox4JY1SgbiMgl3lk
         WDuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7r0OGVqValNl83tZIhZBH/ukI8tl6SJRbiHCWL4QjHW0Ffw3O57Laivf1jMqL1n7LIBQ/Agg+Nim8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz1QWZ9rCkfHpJ5xpKMYHEVsvRA28m1BffxIsZGhQdRjvVVoEO1
	lLlTyyAu1zuHuWbgKtYIUZvBhHV4Le27XPy8mzT0XADY6vtxdiwb+c8wOpi++kNEaCOWlRMwSRG
	ZxNA4LPAIwQXuPz8npmPAwukYg0KM7Gg=
X-Gm-Gg: ASbGncsEyMRMkcS+nqnwcGqWxCR78z3AQ40v3EW6SbLmtbdvCeNeeZ3JG5+XHdjD+o4
	Z5IGEt2QsUNiiGf36M982I24oP6yFfrN4i0niVpmf3Fi6gXLH2JtWPUW66ob2B0Y6lZdkOVpEj7
	U+OHcr8LTUEY6mrxxsdmYPgquoiC8rHGiShWYnOA8QOn4jbgU8BJNtjInGxOIDxNzjNZySoarzQ
	cPSmVVB3ybRmDNwUye4J2HGHAXC5mEA5ZmjxyT6qg==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 1:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Please wrap commit message according to Linux coding style / submission
I will do this for v2

> To me your patchset is way too big bomb, too difficult to review. You
v2 will be small.

--
Askar Safin
