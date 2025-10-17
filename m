Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78014331A43
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Oct 2025 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706308; cv=none; b=bC0Z+8jAQOn5K/+N5/8RBa5wPTxFXjJmejXIQxEKsnbo7wV+YSeK0WZaQRaUy2i2PH+e2NvCV1KSUc8w4zJ9DygHtdr/DOtpEqV4sAsUOQx4Tc8z5dYRTYYP4vmUrnJE8faSGznEMg2k2gG0CNkaeDhVsYOZXegWiydoYpcLMu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706308; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YLy3/LcoXyrYjY6LzAOgUxb85+CY/LRpJZbfOkBNsPZN1cgcRGgEqPEoYDE2GnGdKLJoxT2cq8Sfae1+HokNkhX0CGezmiNFymCdrIB/owlbR7lupkdXGB6NJkBv3eFJRaXMeGgMbXyG684jJUT6HrAehvSNpdAWEYCPUoxYznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=YqjQTaUx reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="YqjQTaUx"
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 574535338032
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Oct 2025 07:45:33 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705133; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=YqjQTaUxSfhqWABffd0N6+N84iiAX+UVVrw/kqopbpPZsFa8cdPhB88z9D8Ug+x9gKbJup
	0LnYqpAwqJAlklCVxrWTVEQWMil4ETptBMVKWTdSpbN7Hp5FnMFQwlj49uFgeLlR9hEurE
	J6FU1PqPfIfqc4F0/p2ozGAVESzElioDozeM/s0cHmXeC5B6WWR1f1i3Ox60htviHCDU0D
	qli00+FfYBl+pw5ZNTSvJpHqOWVP72+G6JNAyijwO+MFqdWF7nXV5YKanZePUYB7AMFvOI
	8GiEWfVPpwkbDftChpWysPRLP3e5fTXgyaX4pSPZyMiE3sE5F4Xxh+u+HzEaqQ==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-m68k@lists.linux-m68k.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:32 -0700
Message-ID: <20251017054532.5032BCC74464943A@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.
