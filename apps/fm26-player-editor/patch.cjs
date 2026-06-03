const fs = require('fs');
const path = require('path');

const file = path.join(__dirname, 'src', 'App.tsx');
let text = fs.readFileSync(file, 'utf8');

text = text.replace('  unresolvedUids: number[]\n}', '  unresolvedUids: number[]\n  summaryNarrative: string\n}');

const target = '              </div>\r\n              <div className="report-grid">';
const replacement = `              </div>\r\n              {report.summaryNarrative && (\r\n                <div className="report-narrative" style={{ padding: '1rem', background: 'var(--surface-sunken)', borderRadius: '8px', borderLeft: '4px solid var(--accent)', marginBottom: '1rem', fontStyle: 'italic', lineHeight: '1.6' }}>\r\n                  <p style={{ margin: 0 }}>\r\n                    <Sparkles size={16} style={{ display: 'inline', marginRight: '6px', verticalAlign: 'text-bottom', color: 'var(--accent)' }} />\r\n                    {report.summaryNarrative}\r\n                  </p>\r\n                </div>\r\n              )}\r\n              <div className="report-grid">`;
text = text.replace(target, replacement);

const target2 = '              </div>\n              <div className="report-grid">';
const replacement2 = `              </div>\n              {report.summaryNarrative && (\n                <div className="report-narrative" style={{ padding: '1rem', background: 'var(--surface-sunken)', borderRadius: '8px', borderLeft: '4px solid var(--accent)', marginBottom: '1rem', fontStyle: 'italic', lineHeight: '1.6' }}>\n                  <p style={{ margin: 0 }}>\n                    <Sparkles size={16} style={{ display: 'inline', marginRight: '6px', verticalAlign: 'text-bottom', color: 'var(--accent)' }} />\n                    {report.summaryNarrative}\n                  </p>\n                </div>\n              )}\n              <div className="report-grid">`;
text = text.replace(target2, replacement2);

// also mock report
text = text.replace('    positionCounts,\n  }', '    positionCounts,\n    summaryNarrative: "브라우저 미리보기 모드입니다. 팀에 잠재력 높은 유망주가 포진되어 있습니다."\n  }');
text = text.replace('    positionCounts,\r\n  }', '    positionCounts,\r\n    summaryNarrative: "브라우저 미리보기 모드입니다. 팀에 잠재력 높은 유망주가 포진되어 있습니다."\r\n  }');

fs.writeFileSync(file, text, 'utf8');
console.log('App.tsx patched successfully.');
