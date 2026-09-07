Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90463448B93
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772551; cv=none; b=bgNjJ9EEwuZoyyIfv5ZMjgFYYkvdEiddEO2U6V/5awchBpIsiTclRzO1oquh9x8t62WhDaGE5vSFZjMRR6/VzNd2z6bK3y5YX9l3uZXjsSeNe1drP90QegLObCea+rKBnqWmQQYPkxxgQPG9/DAy1qE6HiaojqwYXjKrONvgzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772551; c=relaxed/simple;
	bh=cotydOU2axbEAFuLHXGRT6+++/RL9NtHBZWqpZiF0S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXiAYwIs8T0kDw3hkLmUmUAR1/M18Yrf4mAvevGGbM/WTPyvWseOaTxWOrvzdbGKqpo+MiggUQm/eF8O8lCWUb88F0ae2pjsPMnqQuvsj+VMKEoEdis7IkLnP9iNgdrpfKv5Jne3VbfcOudeYGfYsuQR9GX3uIWdug9wj55o3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX3woP7i; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX3woP7i"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db18e5cb56so29760245ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2026 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772550; x=1789377350; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVqwmOb1crWhYfKndwh2XaY160aqcbjm7eUeqdfFhfA=;
        b=ZX3woP7icVIKz9f0/m3QrAycJiCGlK1Dh8nfOAMM1XtcQOSzsmD5irGWZKuhkhG4St
         IbURIC0nfNmEIwl+jRUcmsu21OUOXLFgq3hDdM4M2lAWqyuEAzB8lFNamZYa0R5OIm63
         JicEgjXV2rCBsrnqVWnOU97wPppaca4SlNnekvhh+hFqIdC4Vmc0OQavDpV17DkF6P48
         EFuhXylUMpaTRCSBID0m/c5Va7uWaQOVpzKoPG3INiSBusYVxDQsbywQpAMpP1VPcIqk
         VGPQbs4+lXCgv7LqiyWcSFH1+Dw2MA94ho2mpIRsyMPof8dV1hmKNP8zqbjxK2q8NKOD
         iYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772550; x=1789377350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVqwmOb1crWhYfKndwh2XaY160aqcbjm7eUeqdfFhfA=;
        b=k/eiyUDS3+RUWcT8ejB/ttcyKtUly3X21q6ZQoge0I/TBqek/faaqF/+M2HhL5Ec0x
         +Z6gNCeQOlBJs5uasRVQSoHxLnO2Oot7iOY2c0YMLa8ISG9qZSQmnbIabn7g7w7wtEIM
         rHH38jeW8cqNX0xMAynGtE2f32lTUOVnJT5Is4KhwrhF3iJCoqnY27293Ll3dJ0DBV6G
         QStyFvtwzZMz+zmiQOgf9YEagpBLIoHlC5gtdTGJzJ8rqiZwcG5vjngbqF/zGd7Wwu6L
         d20BtOZsufAzH359vIaLslZzUfsf3s9ppueCktHo4KZuhUPN9FHYpKk/oqLkQ+d1981w
         bVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1k2sJhS4ifpmVFcbZ9c13ar67jp3tzKlraoDqf/B2zJcHZsKSsaSw1Nay/sbkPyjXvGjaWuMvxm1j@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kS1bm+xxD4xCgWMQABHNaUcpufgjwTwvBayXYf21v/jjpVFu4b
	a5xHfGcYhvzfSp3zwkzHouRh+XE7xYzFo4/wyre0GCh5CJ9pRYUtc9Hd
X-Gm-Gg: AYBFou0cgMOm7kDp6RzJjJFgOMjoz8GEvtGxWWNaStqhvZwaJwqUY6ofuEu4NR+9u7T
	yQqU+3NOgKo82rLGzgS5pdRfgOTN6mvh5a9dvKYQeDfT/cBKhxbsznu+u04q7gg2it1xQhz1h3F
	LvUMgYngoX0XdXjn8uXuMFrUHqCTwqDCfit03AIjCuDfkIjP6dn6SzDiLyRDKL0HtWwksdfoOJs
	NVWfBZ19/Ij2EUSiBYWg4iER8uUzRkOm+tJ20+8VV/peZsesSEmYYWsBMHYIiTz8fgpwt8yPwmB
	mSFdsxpEa+Rv2vSuTk5ZnCWGE6JbE55DsZYLGGOuHsgtejk3aKjpB2WmvfJn6EX+ga6z4EFbiFY
	xohLGn94MBHKIVUgad8FOomH1Z1SBoXizdcZm5TbZ6x+DEZtP5TK1zW0+0zxM6LFUmJtiEAWKcI
	rijgCyAim/5hHY76ZQdMtG2okuoLWqjZ1CXlRPjYv+BGK/FzsZEUPjm4vtw5rqIiqgGdCCDqOQu
	O+wNJF/39pvDtLM+HqH9gLd
X-Received: by 2002:a17:902:6ac3:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2db127cde0fmr248183705ad.12.1788772549877;
        Mon, 07 Sep 2026 02:15:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm40959657eec.16.2026.09.07.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:15:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Josh Juran <jjuran@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
Date: Mon,  7 Sep 2026 14:45:44 +0530
Message-ID: <20260907091544.36558-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com> <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com> <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de> <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sun, Sep 06, 2026 at 02:46:04AM -0400, Josh Juran wrote:
> What about the human reviewing its output?  Or am I misunderstanding
> the meaning of "Signed-off-by"?

You are not misunderstanding it.  My Signed-off-by certifies the DCO,
but sending the patch also means I am answerable for what is in it, and
on this one I did not look hard enough.

The patch came out of a mechanical sweep: checkpatch.pl flags words
listed in scripts/spelling.txt, "reseting" is in that list and
"ColdFure" is not, so nothing pointed at it.  That explains why the
tool stopped there.  It does not explain why I did not, because the two
words are on the same line and reading the comment was my job.

You caught it, and the v2 fixes both words; Greg has since applied it.

The wider lesson I am taking from this is that a large series does not
get to be reviewed in bulk.  Each patch has to be read on its own, in
context, before it goes out, and that is what I will be doing for the
rest of this work.

Thanks for pushing on it rather than letting it through.

Hemanth
