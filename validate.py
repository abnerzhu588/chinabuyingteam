import re
import os
from collections import Counter

with open('es/products.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Check for unclosed tags
for tag in ['a', 'div', 'section', 'li', 'ul', 'p', 'h3', 'span', 'nav', 'header', 'footer', 'main', 'form', 'label', 'textarea', 'button', 'blockquote', 'cite', 'script']:
    opens = len(re.findall(rf'<{tag}[\s>]', content))
    closes = len(re.findall(rf'</{tag}>', content))
    if opens != closes:
        print(f'TAG MISMATCH: {tag}: open={opens}, close={closes}')

# Check for duplicate IDs
ids = re.findall(r'id="([^"]+)"', content)
dupes = {k: v for k, v in Counter(ids).items() if v > 1}
if dupes:
    print(f'DUPLICATE IDs: {dupes}')
else:
    print('No duplicate IDs')

# Check for missing image files
imgs = re.findall(r'src="([^"]+\.(?:jpg|png|webp))"', content)
for img in imgs:
    full_path = os.path.normpath(os.path.join('d:\\chinabuyingteam', img))
    if not os.path.exists(full_path):
        print(f'MISSING IMAGE: {img}')

# Check for missing link targets
links = re.findall(r'href="([^"]+\.html)"', content)
for link in links:
    if link.startswith('http'):
        continue
    full_path = os.path.normpath(os.path.join('d:\\chinabuyingteam', link))
    if not os.path.exists(full_path):
        print(f'BROKEN LINK: {link}')

# Check for aria-label consistency
aria_labels = re.findall(r'aria-label="([^"]+)"', content)
for label in aria_labels:
    if len(label) < 3:
        print(f'SHORT ARIA-LABEL: "{label}"')

print('Validation complete')