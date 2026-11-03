Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719117;
	b=U6eCHqZwiV8gOs7YS57o1C/SYHhk6wRfC2WyCYeBeMVXkVJIBZ0cZjmUrDxjU9heyB3M
	 81gR9zifDWKiRbrB3PCYuNMjIUnDfa48ZMGeFlKqA0X53VPNxjAguaPnvtaZjgBxsHAIz
	 DXajrk4RfqY4bfScjngBLMgIk9v8RLYRDkOjJgnfVXdVxvV88Z7MEPbNfrXVcNebqt3mF
	 oDearaELd3kZ566s31i7N52gnb0bZrWkpgoLFqclryS/Dem4A5Mwi8PaEeBBZFPCgx4s+
	 Yh2nNLJI2Xhv+BsHD6t5ZGiliGuU3AlF7KkWR7COpBRzzEyD+LJr+XudyNwxf9p6tYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719117;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=ntLrK1VmaHM4D3uLLozV9+SKiOYiOFuXJHMlY2hJA9o=;
	b=eftuDPWz+fo13bity1Hqc5ZgThGosl/e+m38UmZiyJBev5Z39fVMsXvpHHkw8YUA2ZGN
	 tnz5P+imyXLof3ybGb1Hd2PiDTg6kjxL6SWtN6KsrTT6YMj5rzzzsO8is9ffDzCQ09ryg
	 M2PCACkJifVzfFEq9Nby8MgXKn4C0Ajoy7SlfYF+2sfnJ3vBiZB7Q3s4J/dNsPKhPoGx3
	 hoWtlQi+lFFfCYUWI2OILpNYgpuhRYWTtrWTJzqap3hcqcfbYknBfJp3OekDEejC7MFMV
	 PNVQ4yPVl00oZQGEZCjUR6a9Qk7yWKusLkRUpyISZIH8gyliOad1KO3sZD9ZugLkEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jirVnaYh;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57091606B27E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57091606B27E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jirVnaYh
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DD5343A75;
	Tue,  3 Nov 2026 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9D11F0093A;
	Tue,  3 Nov 2026 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719117;
	bh=ntLrK1VmaHM4D3uLLozV9+SKiOYiOFuXJHMlY2hJA9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jirVnaYhkMohORjRQHjNee8nF6ygqXhY8sV238z6GnKPRIdRFXtC9V57RpP5UtpYM
	 BisFVd3/AfOBIX1h4bh/i10hSU4Xwaj0/OG69yJkAtpBn3OarcL2g3SCi3pEoS1Nn6
	 fiLAHdSHKuRm9tWtKdyWN8b6+A8blaRqIhVMUC/4QSh4UvN8zzNdAr2V8Vn+QynMT8
	 wnBiOXRGdOMewKhkWEJhuLs2ejgV5WDKFupSr9OgpT6823+WP/w7wK4XuqdVs6opa0
	 n+vfL0Qc5TFEOmXT3KMIfy+47AcEixvBCTRYVL8SFodqsz0UlF26+crcochKH30ngE
	 9GdLw+MaB2T7A==
Message-ID: <sashiko-outbox-195586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/23] md: let procfs own the seq_file of
 /proc/mdstat
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261102-work-procfs-drivers-v1-6-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-6-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:35 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and let procfs open and free the seq_file.
> ->proc_open() only records the event count for ->proc_poll() now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D6

