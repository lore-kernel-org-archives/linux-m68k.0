Received: from mx01lb.world4you.com (mx01lb.world4you.com [81.19.149.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42343E274D
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Jun 2026 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337360; cv=none; b=pPl0r49qtUWXksXRg9MNDoIYMXnkXErNFEQ/7yWRRdn5PeFSoJq5sAf0TPuCKEq0SjPpdN+xP/AK44BwXzdskWwyduvEy3Ynzkyb8qBMYzsa9m8OhB69mZPYZyjeJBA5vKUYcqnehz75T8J38HcHGOBgMPgKtzlCohb8bQNRL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337360; c=relaxed/simple;
	bh=9q183NFC9fS2JbtBL36Ugl1YrAbf8Ci2YCyn/eMtdUU=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=YAy2WIA93ONAqPfsfp+yDgtSD37Ycj9fJQwSoeMkkCPoaO2TZCzUhgmtvZWY6EiHrKgCFUaAO4zyMk1/VpeHCMW52hU9bFbesTp22OSVvlrQPnAGb0Xkm61sy4z9Gu0a3FLWrKChIC5IDF1A00VCRKxoaIA9rJkHN4DmNDRwb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciaorelated.com; spf=pass smtp.mailfrom=ciaorelated.com; arc=none smtp.client-ip=81.19.149.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciaorelated.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciaorelated.com
Received: from 89-26-47-193.stat.cablelink.at ([89.26.47.193] helo=[127.0.0.1])
	by mx01lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <info@ciaorelated.com>)
	id 1wU74e-0000000043c-3YA7
	for linux-m68k@lists.linux-m68k.org;
	Mon, 01 Jun 2026 20:09:17 +0200
From: Dogan Karaarslan <info@ciaorelated.com>
To: linux-m68k@lists.linux-m68k.org
Subject: Open source social media project from Salzburg
Message-ID: <93819d59-b2e1-fc36-f69e-c57a78ad7f07@ciaorelated.com>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:09:16 +0000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-AV-Do-Run: Yes

Hello,

I found your contact through GitHub.

I=E2=80=99m a developer based=
 in Salzburg, and I=E2=80=99ve created an open source social media project =
focused on communities and meaningful connections.

I=E2=80=99d love to share it with you. If you like the idea of an open =
source social media project, I would really appreciate it if you could take=
 a look and maybe star the repository.

I=E2=80=99ve put a lot of heart =
into this project, so any kind of support, feedback, contribution, or =
simply sharing it would mean a lot to me.

Here is the project:
https://github.com/dogankaraarslan1/ciaorelated

Thank you for your time.

Best regards,
Dogan Karaarslan
