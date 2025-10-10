Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80925A642
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Oct 2025 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760072282; cv=none; b=l4pAAJdGfgKI/AdAlQ/FH4Q0clSTFMO2kSbH7FsJEjpI7Qy51ToKkVjokf3Om1YMV1yHnl4qBUXidlpmPbqnY++7CI0yWxytz18z186JcMcoQCfnluhxM+cRTnXMiG3E+Wsof0IPI6vb+GLs+4L2xrKpAfxoTwW5ztnzD7i2aM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760072282; c=relaxed/simple;
	bh=20zVq/I1A85ImSdUuzZ7bh9Qs7dqD4eEIEsQzzw5Ci4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqX4TBrHJxPLRLmQaGHu29WCXsOVJppzidDal/wGIUAs9f+tr5LBK7Bgx3hemMVzNYRvsTyyA8T+fPrgGUhQVcqDP/WJGrJCNs1v15XEPvWVmiYU8kAiulSy9Mh/ivpEV7ErlbHJOfp4FGB7Rpban8OnJ5TXMWSjHtc8SP0KCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZx4ZKAF; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZx4ZKAF"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1693684d50.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760072278; x=1760677078; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=OZx4ZKAFybehGrdsgeuSmi9r2EpkacptyhP+b6C0owvWc7Brl5xENEkL9ox0gdiEl7
         8Y61MCDhL5yy0m4jxYhod8y0EFNqKrL9jIejLQ9R+vxGiuv45dkbPq6iPf5Mx1H2S86g
         B+pqS5xiaFtTK22n/9HjZdl7unq0JqUQdk/i7zCujp0sF88CmmLZHIzRgMehaZwPUSI/
         Y2ugCz9kT7VRzdGvpXv/yJupc7i7uu89VW89vWaE+JHz3hovPebvr+TMosTCJO11BbRa
         bK3HZzyzhA5rPjlpJGIK4lIycgUgU8GqJ3y8hV5iZY8Ei6aGML5zdKfBNJ4YgwDSuVEi
         QKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760072278; x=1760677078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=iYqs6APz2WZ6uHYcPVwOOzrrlS97XoZbeij/p/aEeUDXMnWkJRZUHBg6Pebc0ubjd9
         fwEDFRJDsAgXFQ33Y4jCzpny3f+77Zw6hTsL1KwztD9EfHZJ7kbTUDauT55i1a+oQucw
         lDM+mj3I5NJJ1Xhoacy5U3l3/lfbmCayG2Ty0vXdKMPFQ8+vVt5UgF6kp5yyHVOPhYtG
         c05ODDiZaZGf5yyuKwkbVhniud1ZU1IrnuROLn7v8CX87HGR/RjdDgj2RigHfLp9qF8q
         Q+ebFVWlfHAstay3rYWn1+QtvEoOJG1dUyzKcDHeFUWotR7NidAdBYwSDay9u/91kEaP
         sxsg==
X-Forwarded-Encrypted: i=1; AJvYcCXqIaErHkIqXvtD1pcFwwsKqN2DMdraOWx+re63qupM/SxMYYoQldCIYEa1F6GJJ1hB4An5T11gBiqE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw8uplkONXztYZ3N8afDV/aGRDNprXZ1Rim4XfMnnmhIJbiTgSk
	ZV6byV9R8ouHNJUM4QZ/blRYf2Khjq9pajGK2XpUTEUwRrKID7TfQzIbWP316lDXUMLgnjmVFwC
	9ovodbt1kHj7C1g33o6Thtx5MbuL0lPo=
X-Gm-Gg: ASbGnctfqMZ9Y2MdIKVFOUTwX3XpnQcLiatFJbR+P5+KfT54W03fTbflJ0VXk4BMXRt
	8xQKhhd1RfdOOuc/SXVjekc4WWT130FXKrgt06iDwsjBInkKSh+ClqwH9rr+HSkOp1+9seooil1
	7WrzR+v8BT6lLQ0oRR5SCH1aiuxiYIKID1HYx03ZporCZFIPxH/9F8OpTzaEl6mnbhy2a7D/afp
	uLWO9269paof11iHieRqZCGqw==
X-Google-Smtp-Source: AGHT+IHqDciv7GAPYfMGdKr9Fwuo5GT168N8GcrpsJ5KozP5HqYqg/LDALxuogvzJXgNCm6zrA+DoCqu7lr8uhQrVc0=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr7466309d50.51.1760072277565; Thu, 09 Oct 2025
 21:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
 <20250925131055.3933381-1-nschichan@freebox.fr>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:57:21 +0300
X-Gm-Features: AS18NWAQwCKadWHXCZjVUBNaD3TaKIilJiJAQzSbvGFaYuFuE8UDpW1_H3riB-k
Message-ID: <CAPnZJGBPyONjJoM6cskxysDnN4pxWuWJCK5A6TgikR2xHsrN5Q@mail.gmail.com>
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 4:12=E2=80=AFPM <nschichan@freebox.fr> wrote:
> - drop prompt_ramdisk and ramdisk_start kernel parameters
> - drop compression support
> - drop image autodetection, the whole /initrd.image content is now
>   copied into /dev/ram0
> - remove rd_load_disk() which doesn't seem to be used anywhere.

I welcome any initrd simplification!

> Hopefully my email config is now better and reaches gmail users
> correctly.

Yes, I got this email.

--
Askar Safin
