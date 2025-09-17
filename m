Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419A2FE078
	for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Sep 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132049; cv=none; b=SMeTmvP0KeoWfPnjtTXH/io/h5t+ELn+9l1s2afm+fB6LR51YwKw5oaOK62r5vKMMvM/eg0DInhKhRzJ70tJbN/99wpqwJ+HCHSWEgcef4FxM79uxE9s/GI0/ZZ/YY8+DhFzn1/DublNnUlHoZE/irOz4VYcdMk8U5IIQYzW0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132049; c=relaxed/simple;
	bh=DLDcGQ3mu3T/MPVKq0NF9V2I5Jn6ILZwFaw9KVQfhOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEpLowpb9c2WeJrgZZOOtpRLXKLMYE+WRJ6LCbzqb4b8CdAnchR4i0x0HOgLb5B1V+cSQQ7rGxb4GWB/vlxxUPU84whDGQ4BnZBCobTe0tP0FmJQKIXJN8MQIwRbtuodMy0/NsPqveo5UW40MjMxEdzf9QCxhLY/dDUD3z5ZiHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=ooquV4YE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="ooquV4YE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f76454f69so135557e87.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Sep 2025 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1758132044; x=1758736844; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=ooquV4YENMc/GzIoc7OceXRabcQ0HsxanoQO3aUGTrTRiVHbRrEsSwPXgjnJ7+Wf51
         /qu3Qmq957Gnn+St+MjFCECLWgOBPHWLpYd72y/7DjhXASUx+yYQNLmJxdVa5hxP5vfY
         JphtgBoRtFtaf/o6OU97kuyQwo+s5rQsVUOfdiURcrBXxo6mQq23DRrQ2NGBxtlkWyzN
         Os9X/pXN7+VQrYKOm26uKzoyt30aLcjbEtborjKdnww0bK2drw1kWWECRskHb7FjMCoe
         DB8yhb1pH/phRN8bOucpQvZABFGaqATo68L9NX367LmNpxwUbLaAydcwkTmMQjAA9oE2
         nG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132044; x=1758736844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=rJCfb3hcUsPhnw5EBYqb/Zw4TkWMpIrBDKVWSNUGHq36NbaB5D4ALiljRW8wjzf0NK
         caRcFR8QCvSAhGKM4YeJiXqZNO1HUu9pE9DyuoRe9ga0MXmgr8XcaqMWUglbOpNav5FH
         F2F7naBqgDW5IpVMI2rTuosa/XalLGdRvx5cz/zjEpovxIIbQP34q4fS8IjDIjgwS71k
         aPQ9oJo9yqjYHTfgSJ8JzMpQmdXC/9zXyoPuuq7fO4dU6zQF/tVhBfIs/YbRFem/67X3
         hvTzzts1F3RTL2kCSHOLApaRbh9J6IEpSD8Itl4z9aP3H3L/8v8IDqtD+c/syojUFUgW
         uECA==
X-Forwarded-Encrypted: i=1; AJvYcCWoKg58gGj2kqAucxqWcwmAwwtAwUHjRovrRipoC77qz4ysNZm1pc9KNeQiearzRwXNZex0e8Y04z3l@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzB4wOkVMgHEuO+cKrmZl0TH3X2RqXaTExDKhL++jTnKs019FnC
	27SCz22syj/CLYXXZsP/88Z6LJ3lp9VQDUo738fBKzFK4rkwU/P+EuBqC3cfiXMoBmOSuzpgWS3
	3eWkUe0DlndBS4ccRIW+v1AbnltbaL2IwDMQNsdob
X-Gm-Gg: ASbGncsyka7Ut6zspO6rcpEwYeMte3iaoxtFq8bVRP21NPHGhXAt9DbT6vjFwcVafZw
	3EMqA6q2wySiwmygCP6IXnbmMil5g6p2T4isL1x4DRrSyEnYu0qbRRx+v9iI1uMJVJYl1pkIy5q
	V+mCGe7xHUz3RzP6EKE9eb9EqNsNwFxQfWnxNievkBMgNMsA4+T5Eda1SZRSMDNC34xE9CVm91J
	ubgdA==
X-Google-Smtp-Source: AGHT+IGI+xF2OSgRbI6+fabXiqu9Xwuf5bxWYwnja/rNGOUuSmNzhH42MNUAKuR34Ox7ov8nmiujA9clDhMS84oRbmU=
X-Received: by 2002:ac2:4e09:0:b0:576:d217:3f2f with SMTP id
 2adb3069b0e04-57796b5e819mr1028160e87.3.1758132043747; Wed, 17 Sep 2025
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912223937.3735076-1-safinaskar@zohomail.com> <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
In-Reply-To: <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 17 Sep 2025 11:00:32 -0700
X-Gm-Features: AS18NWAGwakGZ9zjxjq7MnfN8O7ZgOJb6fmKIJ0JIML7P3j0NnlDZ27eNb5S7Es
Message-ID: <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Rob Landley <rob@landley.net>
Cc: Askar Safin <safinaskar@zohomail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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

On Mon, Sep 15, 2025 at 10:09=E2=80=AFAM Rob Landley <rob@landley.net> wrot=
e:

> While you're at it, could you fix static/builtin initramfs so PID 1 has
> a valid stdin/stdout/stderr?
>
> A static initramfs won't create /dev/console if the embedded initramfs
> image doesn't contain it, which a non-root build can't mknod, so the
> kernel plumbing won't see it dev in the directory we point it at unless
> we build with root access.

I have no current insight as to whether there's a kernel issue here,
but why are you trying to put actual device nodes in an actual
filesystem as part of a build process?  It's extremely straightforward
to emit devices nodes in cpio format, and IMO it's far *more*
straightforward to do that than to make a whole directory, try to get
all the modes right, and cpio it up.

I wrote an absolutely trivial tool for this several years ago:

https://github.com/amluto/virtme/blob/master/virtme/cpiowriter.py

it would be barely more complicated to strip the trailer off an cpio
file from some other source, add some device nodes, and stick the
trailer back on.  But it's also really, really, really easy to emit an
entire, functioning cpio-formatted initramfs from plain user code with
no filesystem manipulation at all.  This also makes that portion of
the build reproducible, which is worth quite a bit IMO.

--Andy
