Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA870318142
	for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Sep 2025 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295504; cv=none; b=Iwu0msQhlY+lNLLJ5cQjM8WpnKM5TAKVd9JoWLUAX7zn7XsWcKW4yeCdGa8/MpQ3C7qePmIu/ttL8TZ6uG8IosFQvbRs4rGhuhUq3bi2iPCohOnznUQbPXBfZcaibCdu/g0ZBNGkgS88o2Ef9E8kbHIigv8kpip4xYppMs7U6jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295504; c=relaxed/simple;
	bh=tIBWHHOOKfm2qL1G0oNEg1lQ/EY8RTTkm2B9w+25Bvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbMqiDluawR510nIjqOzUl+duz286VrRh/qg4d2NbGYTN7XoyAA/MH0s6wXQ83J6MqEYv0QRy65aIuH237PTH9h1yRRHH8TaWjFt2kvwMVUIAStfwcqwc3OCyVCZbp9xxqLrr3S4o7JqGZMUaShQleGOpXpBaGVznDSh48unku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=V0cI5JMA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="V0cI5JMA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5725e554ec1so1848253e87.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Sep 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758295500; x=1758900300; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=V0cI5JMA40WjtQ1lRjIk6NQL7rnGSAhBEZLOnxLG2/Ea7Nc47qYMnHZPt+JUDWX1lh
         R50IE9R6DsEk9UhXv23Gw6VmJfFm2K2NgkmqlQm+mXKKmu/80Zfv21bhcedXH/rAHrPC
         kVS72qFlKlhxOo3z64yygc75qZnD/Zf+CP6FspwL01OXd7nwdCM6hQaizBe+QN3qgi16
         ZAYyLDeqdF1qMea6kDPVPJEl+G5z9XHQG6n0ZDONJTQYZIV4vbFDj35gOfM8YmQoBKB5
         Qcv0sM+AQMW44ySNHS8a15mxYSGD0U/jvVy79CxlBFBMzmas2CPWIq0k1pvAehXhVWzG
         A3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295500; x=1758900300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=xIh4Ucobro8IliDd0ilVFO+O0hIxE1+2WkveRM72J/pzw8vlOCYrdgUYLQ00RMykoB
         V1iSomRyi2itPXLE5dHEvWpVjhJlfayLPuFmKTFq6OqxCu00/VZAJIAODz0LdDs3A0ee
         XA6rk0C1n4yEoaC+EIAx1O3i7TqLPveProf+0YfoLM4/ubjVExxHUak3/92se35TeTqc
         VLcOqWKM7FUZ6kWYF+lTGJmkOv1+4j/0wXOx6+IKWKyUpmsagpfZw9OiEIx8xG4DVo5k
         tZfvUo7mwPcxIu7PR+FHwVAGPsT41yVz/U5K3j+TnGSiCIcwMw2hYhaD1MFGK25HjNTN
         BfCA==
X-Forwarded-Encrypted: i=1; AJvYcCVwfBsZiq5KNIFLuNtdufksbsBq13HRxnngoj/3H+zD6wEDqS1wsFZDvgZVVCiQVRnS3xR8ii7Uhk0y@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxVI+ruX6YHny1jkA1OwC6qPmHrSHYGOmtzRbmC3S+eUqwIoG65
	Rrtlfv2HP0Xy3rt/IA7LpkoNfsjOwjMvM4USKabqrrPEZz9D6H3Hh5wdWHpTnZdXjNRe992kW6A
	6pwZqZNmLvjnx46s37BijC06G/beK9nRFECEhFxs+vg==
X-Gm-Gg: ASbGnctTlOT6uEDCJIkjtc41jo5qZwFOC6E1ndw5xe0XQSdPtJjXKNYmOQrh1N6qPRD
	2+6CvhBvY0NZW/Pd+3ESp79TJlqa9YI0cRxEBdo8JA4AmRdfxXfeVj2BejW79gKY4ZlJmtMubnV
	Cj5dfO1vWi8QcnklxpJhVfj63nZnxJ6e7uGr8qkjMccgShwV10XR6iQQ/4Ee8MTMNhSFQxKca0e
	+8UhHaG7OWswDk=
X-Google-Smtp-Source: AGHT+IHin4gQus9SrkFEog2pTedfunr2Ers950l0f82oxrEtfjemfexmsAorW/Dsqdjvay/GpFMt6pfW/hwC+qBHF14=
X-Received: by 2002:a05:6512:2c0b:b0:571:b70b:7dbf with SMTP id
 2adb3069b0e04-579e2507c81mr1455897e87.17.1758295499599; Fri, 19 Sep 2025
 08:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
In-Reply-To: <20250918195806.6337-1-safinaskar@gmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Fri, 19 Sep 2025 17:24:48 +0200
X-Gm-Features: AS18NWBwMqIXE_dMXDlT0ngUIReSbekPPTszWv5gIfg03bAEg3Id33JL3Yqjedw
Message-ID: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@gmail.com>
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

Hello,

> > When booting with root=/dev/ram0 in the kernel commandline,
> > handle_initrd() where the deprecation message resides is never called,
> > which is rather unfortunate (init/do_mounts_initrd.c):

> Yes, this is unfortunate.
>
> I personally still think that initrd should be removed.

Considering that the deprecation message didn't get displayed in some
configurations, maybe it's a bit early at the very least.

> I suggest using workaround I described in cover letter.

I'm not too keen on having an initramfs just to loop-mount
/sys/firmware/initrd, after all current kernels are able to handle the
use case just fine.

It looks like there is a lot of code calling into specific filesystems
so that the initrd code can guess the size of the file system before
copying into /dev/ram0, and I believe this is what causes the main
gripe against initrd today. What is wrong with just copying
/initrd.image using its actual size into /dev/ram0 instead of guessing
it with the help of filesystem specific code ?

> Also, for unknown reasons I didn't get your letter in my inbox.
> (Not even in spam folder.) I ocasionally found it on lore.kernel.org .

Sorry about that, When I used git-send-email yesterday to reply, the
SMTP server I used wasn't authenticated to google, so all gmail
recipients were dropped. Hopefully this work better today.

Regards,

-- 
Nicolas Schichan
