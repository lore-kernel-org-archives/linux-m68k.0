Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872215;
	b=HU6cXMYWwrz0SN2xDKhvqUdlIjs83wKs5b9MtXHuQbqxvsNPRwrdlMaHGsPfnJI9HkW4
	 Ory4Uhq8CxNr6GCpJcKLxBG1SP26iUrJRuNoLpB6fdMGt684N4tyM30W21LlomET7EzIF
	 yIk3GtTbcdd+biUrxN2A9bZbPx8Zp9qPCTfFb21FfPF+1SUpIeGZ/CgedxV1DxIbFUrzH
	 M6YBHGH3srhz08v6X6ee0v1kFMknG+FopXNrI7QSKR83ExhhvXVlYLkzKHd486k7TFqgB
	 dSuC06dF7H5wZmIWaVgiUDY0sE2vjnr53DQYsE1L89iS2ZMZDFbUY/3Kf2kp5V63naw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872215;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=Mq7n2FEX8nuLK6+9qa9DR3aH3kjIhvVQvyP/b4sYUbs+YXbMvTuoFIX5PNgH7XaI+85K
	 FT9U0aIZBgDs/ZtGnGHF1VlCCEPAWyt+j5yLpSN52H0a7IzBQB3vJoYEyrs15M4y+tg4h
	 snaqIxdV1hyWjF5tAn8fmIdMykBxzjqqRZveaQX/9K2eXhXsoZhhYkznXnL3k4C6Plsf5
	 sW4KH8884ynXFbGvD0Wu3PQFRZlbcm1S2+urbywzaeGLcQsvLQhe8pCcFBnazelqxnz8x
	 +AENKQRh5YsXmpqzu0uRQEhPC5wg+2ZLocw8TIxev+HC+V8c8cwNpUOV5/BiyP4TGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED1606A33B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 09:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEED1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c1f548f87so26412546d6.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 01:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872214; x=1794477014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=XrD+WAbJad+Y9wF1op03NLl2uFZSx6m8As8q9WnAODYxpIqMTLhB9IiMiI9sOafi3+
         ZNkKivup9XIRKdlSmEyJ9JycoTwqO89LzxqhaWdqZN8jmYHJWCaKQgu7ay9BpWrXHI62
         6wxk3v2KmanBspLLw6kKefge33eRYFonZ991bNjYcMq12Po+NwVaUarbRPoAd/VlsO4i
         cRK01i8xw9s9B2lpaorrzPAqwAD8dPovqQcGp9q2M3J31DmxRiQno6XdKrnirDqyiz7t
         GZ+FrMizcMtzUmbvTgHqdPB3DXoy9CzfU7RFKYGEKCxcCFiaugiQcJr8yZDVM5U/Gp9C
         U2xw==
X-Forwarded-Encrypted: i=1; AKwUvBz4MYcZ2UCrAhZu3Pz8yIMpIjWiEXAEH/NEsGWitlBVK6e8Y92d5kTPBF7nNYOi0m4LS2RONa/bR4aW@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+TP1Vgk1pKaHDB2opXV+TJtspvciSZVwHjlBosOze2Aiix5hND
	bK9YLvSqVOeHYjk4Wv+ubruoP/iaWtopls4XFREQ2JKCfrY0b4T2v5I0Y6qrkdtFkj4=
X-Gm-Gg: AYBFou1nEY/cWJGjmL5cftJtY7Yey2bf/NJ1gkqJ185jnlC4DMsFionXgR2EB8eyqyY
	yNi7975DrzaeMPC4WFtWn5arXUR30VshtYfTVdzJ8xgVeRfW6CgrXNxfSsc9yMeQuGmst4DJDiG
	vKOOQLgEPPV2VwUXoHlJ+hNirxcE5TQhscVrNQlG3JJICjSwuRzQ5Q3wKPu/KJT9TdlZRxgPm4H
	4RV9Y3tiV2GpX+LuvPcancRtR2b1pCsDXBL3IQW/IOhCKUgpG+IYsyJe7XwxejVrw30KAoFFlAs
	RAh4P/RJSy6uxLvy1OxafMrBGmIsgnhNEl+t8di95XspOaNvPgoLY8L7qtrB1zvqf7Pwht3D+T7
	Z9O4K7fNtSNnQNDL63uJlTdhlbGs02BivKyN8KloOutvK4WWeITIw2u1IPaBkCVf617AneXIfz/
	HqKeAYZ4INijS4rsWfapzLSnz3W8bToCynp1pST7LSoNjE67jNvDVXHd/TKvhNmE9C6ITtNCLDc
	wb/xdmZLOaP7cYPitYKfYlwIttSzSA571o2fQoqwWP4HfSmp5EJr/gPFsuEnhHALRXhDDRMbGg1
	lUq9Jdk+MSwkWfxxorJHXaOQV9Saaf5xCmn6MpgG+Xt6UmmvbwXr0DTkX8ghi8f53j4Aqw==
X-Received: by 2002:a05:6214:4703:b0:91e:760c:b8c5 with SMTP id 6a1803df08f44-91e760d7beamr93337336d6.44.1793872213516;
        Thu, 05 Nov 2026 01:50:13 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7d91148dsm43616256d6.0.2026.11.05.01.50.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:50:13 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533778ab0bdso18427081cf.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 01:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwCTYvgtY0zR02vvkcRvDba+C/cKoUjLbNCkEfgHViVnW7MuJbX7+9wFmdgmjz5xysb1KVv41CYVCXO@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
